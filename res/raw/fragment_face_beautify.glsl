precision mediump float;

varying highp vec2 textureCoordinate;
varying highp vec2 textureCoordinate2;
varying highp vec2 textureCoordinate3;

uniform sampler2D sTexture;
uniform sampler2D inputImageTexture2;
uniform sampler2D inputImageTexture3;
uniform mediump float smoothDegree;
uniform mediump float logValue;

void main()
{
    highp vec4 origin4 = texture2D(sTexture,textureCoordinate);
    highp vec3 origin = origin4.rgb;
    highp vec3 bilateral = texture2D(inputImageTexture2, textureCoordinate2).rgb;
    highp vec3 sobel = texture2D(inputImageTexture3, textureCoordinate3).rgb;
    highp vec3 mSmooth;
    lowp float r = origin.r;
    lowp float g = origin.g;
    lowp float b = origin.b;
    if (sobel.r < 0.2 && r > 0.3725 && g > 0.1568 && b > 0.0784 && r > b && (max(max(r, g), b) - min(min(r, g), b)) > 0.0588 && abs(r-g) > 0.0588) {
        mSmooth = (1.0 - smoothDegree) * (origin - bilateral) + bilateral;
    }
    else {
        mSmooth = origin;
    }
    mSmooth.r = log(1.0 + logValue * mSmooth.r)/log(1.0 + logValue);
    mSmooth.g = log(1.0 + logValue * mSmooth.g)/log(1.0 + logValue);
    mSmooth.b = log(1.0 + logValue * mSmooth.b)/log(1.0 + logValue);
    gl_FragColor = vec4(mSmooth, origin4.a);
}