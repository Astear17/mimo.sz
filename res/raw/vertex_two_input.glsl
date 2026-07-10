attribute vec4 aPosition;
attribute vec2 aTextureCoord;
attribute vec2 inputTextureCoordinate2;

varying vec2 textureCoordinate;
varying vec2 textureCoordinate2;
void main() {
  gl_Position = aPosition;
  textureCoordinate = aTextureCoord.xy;
  textureCoordinate2 = inputTextureCoordinate2.xy;
}