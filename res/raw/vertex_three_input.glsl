attribute vec4 aPosition;
attribute vec2 aTextureCoord;
attribute vec2 inputTextureCoordinate2;
attribute vec2 inputTextureCoordinate3;

varying vec2 textureCoordinate;
varying vec2 textureCoordinate2;
varying vec2 textureCoordinate3;
void main() {
  gl_Position = aPosition;
  textureCoordinate = aTextureCoord.xy;
  textureCoordinate2 = inputTextureCoordinate2.xy;
  textureCoordinate3 = inputTextureCoordinate3.xy;
}