#pragma header

uniform float red;

void main() {
    vec2 uv = openfl_TextureCoordv;

    gl_FragColor = flixel_texture2D(bitmap, uv);
    gl_FragColor.r *= red;
}