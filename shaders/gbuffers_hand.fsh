#version 120

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform vec4 entityColor;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

void main() {
	vec4 color = texture2D(texture, texcoord) * glcolor;
	color *= texture2D(lightmap, lmcoord);
	color.rgb = mix(color.rgb, entityColor.rgb, entityColor.a);
	if (color.a < 0.1) discard;
/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
