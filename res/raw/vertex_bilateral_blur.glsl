attribute vec4 aPosition;
attribute vec4 aTextureCoord;

const int GAUSSIAN_SAMPLES = 5;

uniform float texelWidthOffset;
uniform float texelHeightOffset;

varying vec2 vTextureCoord;
varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];

void main()
{
    gl_Position = aPosition;
    vTextureCoord = aTextureCoord.xy;

    // Calculate the positions for the blur
    int multiplier = 0;
    vec2 blurStep;
    vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    lowp int factors[5];
    //在荣耀p9的GPU上，不支持数组在声明的时候初始化
    factors[0] = -4;
    factors[1] = -2;
    factors[2] = 0;
    factors[3] = 2;
    factors[4] = 4;
    for (int i = 0; i < GAUSSIAN_SAMPLES; i++)
    {
        multiplier = factors[i];
        // Blur in x (horizontal)
        blurStep = float(multiplier) * singleStepOffset;
        blurCoordinates[i] = aTextureCoord.xy + blurStep;
    }
}