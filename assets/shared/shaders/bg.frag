#pragma header

uniform sampler2D bg;
uniform float iTime;

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv;
    vec2 ruv = uv;
    //uv.x += sin(((uv.x/16.)*1000.)+(iTime*2.))/50.;
    uv.xy += sin(((uv.yx/32.)*900.)+(iTime*3.))/40.;
    uv.x += sin(((uv.y/14.)*900.)+(iTime*3.))/40.;
    vec3 col = flixel_texture2D(bg, uv).xyz;
    vec3 realcol = flixel_texture2D(bg, uv).xyz;
    //col.b *= 2.;
    //col.rg *= 0.75;
    if (realcol.b > 0.5) {
        col.rgb += sin(ruv.x+uv.y*iTime*1.)*0.2;
        //col.rgb += 0.5;
        col.g += 0.2;
    }

    gl_FragColor = vec4(col,1.0);
}