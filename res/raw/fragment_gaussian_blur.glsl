uniform sampler2D sTexture;

const lowp int GAUSSIAN_SAMPLES = 9;

varying highp vec2 textureCoordinate;
varying highp vec2 blurCoordinates[GAUSSIAN_SAMPLES];

void main()
{
    lowp vec3 sum = vec3(0.0);
    lowp vec4 fragColor=texture2D(sTexture,textureCoordinate);

    sum += texture2D(sTexture, blurCoordinates[0]).rgb * 0.05;
    sum += texture2D(sTexture, blurCoordinates[1]).rgb * 0.09;
    sum += texture2D(sTexture, blurCoordinates[2]).rgb * 0.12;
    sum += texture2D(sTexture, blurCoordinates[3]).rgb * 0.15;
    sum += texture2D(sTexture, blurCoordinates[4]).rgb * 0.18;
    sum += texture2D(sTexture, blurCoordinates[5]).rgb * 0.15;
    sum += texture2D(sTexture, blurCoordinates[6]).rgb * 0.12;
    sum += texture2D(sTexture, blurCoordinates[7]).rgb * 0.09;
    sum += texture2D(sTexture, blurCoordinates[8]).rgb * 0.05;

    gl_FragColor = vec4(sum,fragColor.a);
}