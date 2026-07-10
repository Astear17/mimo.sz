 varying highp vec2 vTextureCoord;

 uniform sampler2D sTexture;
 uniform lowp float saturation;
 uniform lowp float brightness;
 uniform lowp float contrast;

 // Values from \"Graphics Shaders: Theory and Practice\by Bailey and Cunningham
 const mediump vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);

 void main()
 {
    lowp vec4 textureColor = texture2D(sTexture, vTextureCoord);
    lowp float luminance = dot(textureColor.rgb, luminanceWeighting);
    lowp vec3 greyScaleColor = vec3(luminance);
    lowp vec3 SBColor = mix(greyScaleColor, textureColor.rgb, saturation) + vec3(brightness);
    gl_FragColor = vec4(((SBColor.rgb - vec3(0.5)) * contrast + vec3(0.5)), textureColor.w);

 }