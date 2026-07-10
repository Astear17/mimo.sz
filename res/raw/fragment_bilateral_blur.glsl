uniform sampler2D sTexture;

const lowp int GAUSSIAN_SAMPLES = 5;

varying highp vec2 vTextureCoord;
varying lowp vec2 blurCoordinates[GAUSSIAN_SAMPLES];

uniform lowp float distanceNormalizationFactor;

void main()
{
    lowp vec4 centralColor4;
    lowp vec3 centralColor;
    lowp float gaussianWeightTotal;
    lowp vec3 sum;
    lowp vec3 sampleColor;
    lowp float distanceFromCentralColor;
    lowp float gaussianWeight;
    lowp float factors[5];
    //在荣耀p9的GPU上，不支持数组在声明的时候初始化
    factors[0] = 0.05;
    factors[1] = 0.12;
    factors[2] = 0.18;
    factors[3] = 0.12;
    factors[4] = 0.05;
    centralColor4 = texture2D(sTexture, blurCoordinates[2]);
    centralColor = centralColor4.rgb;
    gaussianWeightTotal = 0.18;
    sum = centralColor * 0.18;

    for(int i = 0; i < 5; i++) {
        if (i == 2) continue;
        sampleColor = texture2D(sTexture, blurCoordinates[i]).rgb;
        distanceFromCentralColor = min(distance(centralColor, sampleColor) * distanceNormalizationFactor, 1.0);
        gaussianWeight = factors[i] * (1.0 - distanceFromCentralColor);
        gaussianWeightTotal += gaussianWeight;
        sum += sampleColor * gaussianWeight;
    }

    gl_FragColor = vec4(sum / gaussianWeightTotal, centralColor4.a);
}