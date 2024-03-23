#pragma header

uniform float num;

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv.xy;

    vec4 col = flixel_texture2D(bitmap, uv);
    col = mix(col, flixel_texture2D(bitmap, uv-0.01*num), num/10.);
    //col = mix(col, flixel_texture2D(bitmap, uv+0.01*num), 0.3);
    //col = mix(col, flixel_texture2D(bitmap, uv-0.015*num), 0.2);
    //col = mix(col, flixel_texture2D(bitmap, uv+0.015*num), 0.1);
    
    gl_FragColor = col;
}