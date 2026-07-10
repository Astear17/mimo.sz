#version 300 es
precision highp float;// highp
in vec2 vTexCoord;
out vec4 fragColor;

uniform sampler2D uTexture;
uniform sampler2D lookupTable;// lookup texture
uniform lowp float widthBlock;
uniform lowp float heightBlock;
uniform lowp float blockSize;
uniform highp float intensity;

void main()
{
    highp vec4 textureColor = texture(uTexture, vTexCoord);

    highp float blueColor = textureColor.b * (blockSize-1.0);
    bool needDecrypt = (blockSize == 128.0) && (widthBlock == 16.0);
    highp vec2 quad1;
    //floor()返回小于等于x的最大整数值\n+
    quad1.y = floor(floor(blueColor) / widthBlock);
    quad1.x = floor(blueColor) - (quad1.y * widthBlock);

    highp vec2 quad2;
    //ceil()返回大于等于x的最小整数值\n+
    quad2.y = floor(ceil(blueColor) / widthBlock);
    quad2.x = ceil(blueColor) - (quad2.y * widthBlock);
    // ---- 解密行列调换 ----
    //X轴列互换（奇偶列对调）
    if (needDecrypt) {
        if (mod(quad1.x, 2.0) < 1.0) {
            quad1.x += 1.0;
        } else {
            quad1.x -= 1.0;
        }

        //Y轴行互换（奇偶行对调）
        if (mod(quad1.y, 2.0) < 1.0) {
            quad1.y += 1.0;
        } else {
            quad1.y -= 1.0;
        }
        if (mod(quad2.x, 2.0) < 1.0) {
            quad2.x += 1.0;
        } else {
            quad2.x -= 1.0;
        }

        //Y轴行互换（奇偶行对调）
        if (mod(quad2.y, 2.0) < 1.0) {
            quad2.y += 1.0;
        } else {
            quad2.y -= 1.0;
        }
    }

    highp vec2 texPos1;
    texPos1.x = (quad1.x / widthBlock) + 0.5/ (widthBlock * blockSize) + ((blockSize - 1.0)/(widthBlock * blockSize) * textureColor.r);
    texPos1.y = (quad1.y / heightBlock) + 0.5/ (heightBlock * blockSize) + ((blockSize - 1.0) / (heightBlock * blockSize) * textureColor.g);

    highp vec2 texPos2;
    texPos2.x = (quad2.x / widthBlock) + 0.5 / (widthBlock * blockSize) + ((blockSize - 1.0) / (widthBlock * blockSize) * textureColor.r);
    texPos2.y = (quad2.y / heightBlock) + 0.5 / (heightBlock * blockSize) + ((blockSize - 1.0) / (heightBlock * blockSize) * textureColor.g);
    vec4 newColor1 = texture(lookupTable, texPos1);
    vec4 newColor2 = texture(lookupTable, texPos2);
    if (needDecrypt) {
        if (mod(quad1.x, 2.0) == 0.0) {
            newColor1 = vec4(newColor1.b, newColor1.r, newColor1.g, newColor1.a);
        } else {
            newColor1 = vec4(newColor1.b, newColor1.g, newColor1.r, newColor1.a);
        }
        if (mod(quad2.x, 2.0) == 0.0) {
            newColor2= vec4(newColor2.b, newColor2.r, newColor2.g, newColor2.a);
        } else {
            newColor2 = vec4(newColor2.b, newColor2.g, newColor2.r, newColor2.a);
        }
    }
    //mix() uses a value from 0-1 to mix the two colors
    //fract() return 参数的小数部分
    vec4 newColor = mix(newColor1, newColor2, fract(blueColor));
    fragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), intensity);

}