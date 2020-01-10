// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

//!DESC RAVU-Zoom (chroma, r2)
//!HOOK CHROMA
//!BIND HOOKED
//!BIND ravu_zoom_lut2
//!BIND LUMA
//!WIDTH LUMA.w
//!HEIGHT LUMA.h
//!OFFSET ALIGN
//!WHEN HOOKED.w LUMA.w < HOOKED.h LUMA.h < *
vec4 hook() {
vec2 pos = HOOKED_pos * HOOKED_size;
vec2 subpix = fract(pos - 0.5);
pos -= subpix;
subpix = LUT_POS(subpix, vec2(9.0));
vec2 subpix_inv = 1.0 - subpix;
subpix /= vec2(2.0, 288.0);
subpix_inv /= vec2(2.0, 288.0);
vec2 sample0 = HOOKED_tex((pos + vec2(-1.0,-1.0)) * HOOKED_pt).xy;
float luma0 = LUMA_tex(HOOKED_pt * (pos + vec2(-1.0,-1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample1 = HOOKED_tex((pos + vec2(-1.0,0.0)) * HOOKED_pt).xy;
float luma1 = LUMA_tex(HOOKED_pt * (pos + vec2(-1.0,0.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample2 = HOOKED_tex((pos + vec2(-1.0,1.0)) * HOOKED_pt).xy;
float luma2 = LUMA_tex(HOOKED_pt * (pos + vec2(-1.0,1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample3 = HOOKED_tex((pos + vec2(-1.0,2.0)) * HOOKED_pt).xy;
float luma3 = LUMA_tex(HOOKED_pt * (pos + vec2(-1.0,2.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample4 = HOOKED_tex((pos + vec2(0.0,-1.0)) * HOOKED_pt).xy;
float luma4 = LUMA_tex(HOOKED_pt * (pos + vec2(0.0,-1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample5 = HOOKED_tex((pos + vec2(0.0,0.0)) * HOOKED_pt).xy;
float luma5 = LUMA_tex(HOOKED_pt * (pos + vec2(0.0,0.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample6 = HOOKED_tex((pos + vec2(0.0,1.0)) * HOOKED_pt).xy;
float luma6 = LUMA_tex(HOOKED_pt * (pos + vec2(0.0,1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample7 = HOOKED_tex((pos + vec2(0.0,2.0)) * HOOKED_pt).xy;
float luma7 = LUMA_tex(HOOKED_pt * (pos + vec2(0.0,2.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample8 = HOOKED_tex((pos + vec2(1.0,-1.0)) * HOOKED_pt).xy;
float luma8 = LUMA_tex(HOOKED_pt * (pos + vec2(1.0,-1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample9 = HOOKED_tex((pos + vec2(1.0,0.0)) * HOOKED_pt).xy;
float luma9 = LUMA_tex(HOOKED_pt * (pos + vec2(1.0,0.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample10 = HOOKED_tex((pos + vec2(1.0,1.0)) * HOOKED_pt).xy;
float luma10 = LUMA_tex(HOOKED_pt * (pos + vec2(1.0,1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample11 = HOOKED_tex((pos + vec2(1.0,2.0)) * HOOKED_pt).xy;
float luma11 = LUMA_tex(HOOKED_pt * (pos + vec2(1.0,2.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample12 = HOOKED_tex((pos + vec2(2.0,-1.0)) * HOOKED_pt).xy;
float luma12 = LUMA_tex(HOOKED_pt * (pos + vec2(2.0,-1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample13 = HOOKED_tex((pos + vec2(2.0,0.0)) * HOOKED_pt).xy;
float luma13 = LUMA_tex(HOOKED_pt * (pos + vec2(2.0,0.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample14 = HOOKED_tex((pos + vec2(2.0,1.0)) * HOOKED_pt).xy;
float luma14 = LUMA_tex(HOOKED_pt * (pos + vec2(2.0,1.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec2 sample15 = HOOKED_tex((pos + vec2(2.0,2.0)) * HOOKED_pt).xy;
float luma15 = LUMA_tex(HOOKED_pt * (pos + vec2(2.0,2.0) - HOOKED_off) + LUMA_pt * tex_offset).x;
vec3 abd = vec3(0.0);
float gx, gy;
gx = (luma4-luma0);
gy = (luma1-luma0);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (luma5-luma1);
gy = (luma2-luma0)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma6-luma2);
gy = (luma3-luma1)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma7-luma3);
gy = (luma3-luma2);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (luma8-luma0)/2.0;
gy = (luma5-luma4);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma9-luma1)/2.0;
gy = (luma6-luma4)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (luma10-luma2)/2.0;
gy = (luma7-luma5)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (luma11-luma3)/2.0;
gy = (luma7-luma6);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma12-luma4)/2.0;
gy = (luma9-luma8);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma13-luma5)/2.0;
gy = (luma10-luma8)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (luma14-luma6)/2.0;
gy = (luma11-luma9)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (luma15-luma7)/2.0;
gy = (luma11-luma10);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma12-luma8);
gy = (luma13-luma12);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (luma13-luma9);
gy = (luma14-luma12)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma14-luma10);
gy = (luma15-luma13)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (luma15-luma11);
gy = (luma15-luma14);
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
float a = abd.x, b = abd.y, d = abd.z;
float T = a + d, D = a * d - b * b;
float delta = sqrt(max(T * T / 4.0 - D, 0.0));
float L1 = T / 2.0 + delta, L2 = T / 2.0 - delta;
float sqrtL1 = sqrt(L1), sqrtL2 = sqrt(L2);
float theta = mix(mod(atan(L1 - a, b) + 3.141592653589793, 3.141592653589793), 0.0, abs(b) < 1.192092896e-7);
float lambda = sqrtL1;
float mu = mix((sqrtL1 - sqrtL2) / (sqrtL1 + sqrtL2), 0.0, sqrtL1 + sqrtL2 < 1.192092896e-7);
float angle = floor(theta * 24.0 / 3.141592653589793);
float strength = mix(mix(0.0, 1.0, lambda >= 0.004), mix(2.0, 3.0, lambda >= 0.05), lambda >= 0.016);
float coherence = mix(mix(0.0, 1.0, mu >= 0.25), 2.0, mu >= 0.5);
float coord_y = ((angle * 4.0 + strength) * 3.0 + coherence) / 288.0;
vec2 res = vec2(0.0);
vec4 w;
w = texture(ravu_zoom_lut2, vec2(0.0, coord_y) + subpix);
res += sample0 * w[0];
res += sample1 * w[1];
res += sample2 * w[2];
res += sample3 * w[3];
w = texture(ravu_zoom_lut2, vec2(0.5, coord_y) + subpix);
res += sample4 * w[0];
res += sample5 * w[1];
res += sample6 * w[2];
res += sample7 * w[3];
w = texture(ravu_zoom_lut2, vec2(0.0, coord_y) + subpix_inv);
res += sample15 * w[0];
res += sample14 * w[1];
res += sample13 * w[2];
res += sample12 * w[3];
w = texture(ravu_zoom_lut2, vec2(0.5, coord_y) + subpix_inv);
res += sample11 * w[0];
res += sample10 * w[1];
res += sample9 * w[2];
res += sample8 * w[3];
res = clamp(res, 0.0, 1.0);
return vec4(res, 0.0, 0.0);
}
//!TEXTURE ravu_zoom_lut2
//!SIZE 18 2592
//!FORMAT rgba16f
//!FILTER LINEAR