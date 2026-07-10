uniform sampler2D sTexture;

const lowp int GAUSSIAN_SAMPLES = 9;

varying highp vec2 textureCoordinate;
varying highp vec2 blurCoordVer[GAUSSIAN_SAMPLES];
varying highp vec2 blurCoordHor[GAUSSIAN_SAMPLES];

void main()
{
    lowp vec3 sum = vec3(0.0);
    lowp vec4 fragColor=texture2D(sTexture,textureCoordinate);

    sum += texture2D(sTexture, blurCoordVer[0]).rgb * 0.05;
    sum += texture2D(sTexture, blurCoordVer[1]).rgb * 0.09;
    sum += texture2D(sTexture, blurCoordVer[2]).rgb * 0.12;
    sum += texture2D(sTexture, blurCoordVer[3]).rgb * 0.15;
    sum += texture2D(sTexture, blurCoordVer[4]).rgb * 0.18;
    sum += texture2D(sTexture, blurCoordVer[5]).rgb * 0.15;
    sum += texture2D(sTexture, blurCoordVer[6]).rgb * 0.12;
    sum += texture2D(sTexture, blurCoordVer[7]).rgb * 0.09;
    sum += texture2D(sTexture, blurCoordVer[8]).rgb * 0.05;

    gl_FragColor = vec4(sum,fragColor.a);
}