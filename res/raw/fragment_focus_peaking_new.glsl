#extension GL_OES_EGL_image_external : require
precision highp float;
uniform samplerExternalOES sTexture;
uniform highp vec2 pixelSize;
uniform float gain;
uniform int selector;
varying highp vec2 vTextureCoord;

void main()
{
    vec3 px = texture2D(sTexture, vTextureCoord + vec2(0.0, 0.0)).rgb;
    float r = 4.21875 * px.r - 1.0546875 * (
    texture2D(sTexture, vTextureCoord + vec2(0, -pixelSize.y/1.5)).r
    + texture2D(sTexture, vTextureCoord + vec2(-pixelSize.x/1.5, 0)).r
    + texture2D(sTexture, vTextureCoord + vec2(pixelSize.x/1.5, 0)).r
    + texture2D(sTexture, vTextureCoord + vec2(0, pixelSize.y/1.5)).r
    );
    r = step(0.01373291015625, r) * r * gain;
    px[selector] += r;
    gl_FragColor = vec4(px.rgb, 1.0);
}