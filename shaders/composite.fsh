#version 120

uniform sampler2D gcolor;

varying vec2 texcoord;

void main() {
	vec3 c = texture2D(gcolor, texcoord).rgb;
	float l = dot(c, vec3(0.299, 0.587, 0.114));
	c = mix(vec3(l), c, 1.15);
	c *= vec3(0.95, 1.0, 1.08);
	vec2 uv = texcoord * (1.0 - texcoord.yx);
	c *= clamp(pow(uv.x * uv.y * 16.0, 0.25), 0.0, 1.0);
/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(c, 1.0);
}
