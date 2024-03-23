#pragma header

uniform float shit;

void main()
{
    vec2 uv = (openfl_TextureCoordv)*2. - 0.5;
    vec2 uvR = uv;
    
    uv *= mat2(1., shit, 0., 1.);
    uv.y += 0.5;
    vec4 col = flixel_texture2D(bitmap, uv);
      
    if (uv.x <= 0. || uv.x > 1. || uv.y <= 0. || uv.y > 1.)
        col = vec4(0.);

    //if ((uv * mat2(0.2, 0.75, 1., 0.)).x*2. > 0.2)
        gl_FragColor = col;
}