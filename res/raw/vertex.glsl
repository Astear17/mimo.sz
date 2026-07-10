attribute vec4 aPosition;
attribute vec2 aTextureCoord;
varying vec2 vTextureCoord;
uniform mat4 mvpMatrix;

void main() {
  gl_Position = aPosition;
  vTextureCoord = (mvpMatrix * vec4(aTextureCoord, 0.0, 1.0)).xy;
}