#extension GL_OES_EGL_image_external : require

precision lowp float;
varying vec2 vTextureCoord;

uniform samplerExternalOES sTexture;

const lowp vec4 range = vec4(0, 1.0, 0, 1.0);
uniform lowp float widthReci;
uniform lowp float heightReci;
uniform lowp float threshold;

const lowp vec4 RED = vec4(1.0, 0, 0, 1.0);
const lowp vec4 GREEN = vec4(0, 1.0, 0, 1.0);
const lowp vec4 BLUE = vec4(0, 0, 1.0, 1.0);


lowp vec4 sampleNoClamp(lowp float dx, lowp float dy)
{
    lowp vec2 texcord = vTextureCoord.st+vec2(dx, dy);
    return texture2D(sTexture, texcord);
}

void main()
{
    lowp float blockWidth = 1.5*widthReci;
    lowp float blockHeight = 1.5*heightReci;
    lowp float c1 = mod(vTextureCoord.x, 2.0*blockWidth);
    c1 = step(blockWidth, c1);
    lowp float c2 = mod(vTextureCoord.y, 2.0*blockHeight);
    c2 = step(blockHeight, c2);
    lowp float horRange = 0.99;
    lowp float verRange = 0.97;
    if (c1*c2>0.0 || vTextureCoord.x > (horRange) || vTextureCoord.y > (verRange) || vTextureCoord.x < (1.0-horRange) || vTextureCoord.y < (1.0-verRange)) {
        gl_FragColor = sampleNoClamp(0.0, 0.0);
    }
    else {
        lowp vec4 leftTop = sampleNoClamp(-widthReci, +heightReci);
        lowp vec4 midTop = sampleNoClamp(0.0, +heightReci);
        lowp vec4 rightTop = sampleNoClamp(+widthReci, +heightReci);
        lowp vec4 leftMid = sampleNoClamp(-widthReci, 0.0);
        lowp vec4 midMid = sampleNoClamp(0.0, 0.0);
        lowp vec4 rightMid = sampleNoClamp(+widthReci, 0.0);
        lowp vec4 leftBottom = sampleNoClamp(-widthReci, -heightReci);
        lowp vec4 midBottom = sampleNoClamp(0.0, -heightReci);
        lowp vec4 rightBottom = sampleNoClamp(+widthReci, -heightReci);

        gl_FragColor = midMid;
        lowp float MAG = length((
        -6.834 * leftBottom
        +2.142 * midBottom
        -6.834 * rightBottom
        +2.142 * leftMid
        +18.717* midMid
        +2.142 * rightMid
        -6.834 * leftTop
        +2.142 * midTop
        -6.834 * rightTop
        ).rgb);
        if (MAG>threshold)
        gl_FragColor = vec4(GREEN.xyz, gl_FragColor.a);
    }
}
