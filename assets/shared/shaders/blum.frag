#pragma header

vec4 GaussBlur22(vec2 coord, sampler2D tex, float mult/*, float lodlevel, bool isBlurVert*/)
{
   vec4 sum = vec4(0.);
   //vec2 axis = isBlurVert ? vec2(0., 1.) : vec2(1., 0.);
   vec2 axis = vec2(1., 0.5);

   const float weight[11] = float[11](
      0.082607,
      0.080977,
      0.076276,
      0.069041,
      0.060049,
      0.050187,
      0.040306,
      0.031105,
      0.023066,
      0.016436,
      0.011254
   );

   for (int i = -10; i < 11; i++)
   {
      float currweight = weight[abs(i)];
      sum += flixel_texture2D(tex, vec2(coord.xy + axis.xy * float(i) * (1.0 / openfl_TextureSize.xy) * mult)) * currweight;
   }

   return sum;
}

void main()
{
   //vec4 bloom = vec4(0.);
   vec2 uv = openfl_TextureCoordv.xy;
   //bloom.xyz = GaussBlur22(uv, bitmap, 0.75/*, 0., true*/).xyz * 1.5;   
   //bloom.w = GaussBlur22(uv, bitmap, 32. * 1000., 0., false).w * 2.5; // to have anamflare texture (bloom.w) avoid vertical blur
   gl_FragColor = GaussBlur22(uv, bitmap, 0.5/*, 0., true*/) * 1.5;
}