precision mediump float;

varying highp vec2 textureCoordinate;
varying highp vec2 textureCoordinate2;
uniform sampler2D sTexture;
uniform sampler2D inputImageTexture2;

void main() {

    lowp vec4 textureColor = texture2D(sTexture, textureCoordinate);
    lowp vec4 textureColor2 = texture2D(inputImageTexture2, textureCoordinate2);
    lowp vec4 textureColor3 = max(textureColor, textureColor2);

    gl_FragColor = textureColor3;
}