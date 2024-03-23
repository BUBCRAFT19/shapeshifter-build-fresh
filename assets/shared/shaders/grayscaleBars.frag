#pragma header

#define PI 3.14159265359

float hola = 0.1;

uniform bool rojo;
uniform float iTime;

void main()
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = openfl_TextureCoordv.xy;

    vec4 col = flixel_texture2D(bitmap, uv);
    
    if (uv.y < hola+(sin(uv.x*PI)/84.) || uv.y+(sin(uv.x*PI)/84.) > -(hola-1.))
        gl_FragColor = col.bbba/8.;
    else
        gl_FragColor = col;

    if (rojo) gl_FragColor = mix(gl_FragColor, gl_FragColor * vec4((sin(iTime*2.5)*2.5)+3.5, 1., 1., 1.), 0.5);
}