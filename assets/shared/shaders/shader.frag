#pragma header

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv.xy;

    vec4 col = vec4(flixel_texture2D(bitmap, uv).rg, (flixel_texture2D(bitmap, uv+vec2(0., 0.001)).b+flixel_texture2D(bitmap, uv+vec2(0., 0.0012)).b+flixel_texture2D(bitmap, uv+vec2(0., 0.01)).b)/3., flixel_texture2D(bitmap, uv).a);
    gl_FragColor = col;
}