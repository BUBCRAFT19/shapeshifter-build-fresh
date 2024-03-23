#pragma header

uniform float scale;

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv.xy;
    vec2 uv1 = uv*vec2(scale, 1.)-vec2((0.5*(scale-1.)), 0.);
    float scale2 = (-(scale-1.)) + 1.;
    vec2 uv2 = uv*vec2(scale2, 1.)-vec2((0.5*(scale2-1.)), 0.);

    vec4 col = vec4(texture2D(bitmap, uv1).r, texture2D(bitmap, uv).g, texture2D(bitmap, uv2).b, texture2D(bitmap, uv).a);
    
    gl_FragColor = col;
}