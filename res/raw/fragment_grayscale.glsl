precision mediump float;

varying vec2 vTextureCoord;
uniform sampler2D sTexture;
const mediump vec3 W = vec3(0.2125, 0.7154, 0.0721);

void main()
{
  mediump vec4 textureColor = texture2D(sTexture, vTextureCoord);
  float luminance = dot(textureColor.rgb, W);

  gl_FragColor = vec4(vec3(luminance), textureColor.a);
}