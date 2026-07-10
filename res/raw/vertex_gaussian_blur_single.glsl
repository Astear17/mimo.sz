attribute vec4 aPosition;
attribute vec4 aTextureCoord;

const int GAUSSIAN_SAMPLES = 9;

uniform float texelWidthOffset;
uniform float texelHeightOffset;

varying vec2 textureCoordinate;
varying vec2 blurCoordVer[GAUSSIAN_SAMPLES];
varying vec2 blurCoordHor[GAUSSIAN_SAMPLES];

void main()
{
    gl_Position = aPosition;
    textureCoordinate = aTextureCoord.xy;

    // Calculate the positions for the blur
    int multiplier = 0;
    vec2 blurStepVer;
    vec2 blurStepHor;
    vec2 stepOffsetVer = vec2(0, texelHeightOffset);
    vec2 stepOffsetHor= vec2(texelWidthOffset, 0);

    for (int i = 0; i < GAUSSIAN_SAMPLES; i++)
    {
        multiplier = (i - ((GAUSSIAN_SAMPLES - 1) / 2));
        // Blur in x (horizontal)
        blurStepVer = float(multiplier) * stepOffsetVer;
        blurStepHor = float(multiplier) * stepOffsetHor;
        blurCoordVer[i] = aTextureCoord.xy + blurStepVer;
        blurCoordHor[i] = aTextureCoord.xy + blurStepHor;
    }
}