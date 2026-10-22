#version 150

uniform sampler2D DiffuseSampler;
uniform vec2 OutSize;

in vec2 texCoord;
out vec4 fragColor;

void main() {
    vec3 c = texture(DiffuseSampler, texCoord).rgb;
    // cheap saturation boost + slight cool tint
    float l = dot(c, vec3(0.299, 0.587, 0.114));
    c = mix(vec3(l), c, 1.15);
    c *= vec3(0.95, 1.0, 1.08);
    // cheap vignette
    vec2 uv = texCoord * (1.0 - texCoord.yx);
    float v = uv.x * uv.y * 16.0;
    v = clamp(pow(v, 0.25), 0.0, 1.0);
    c *= v;
    fragColor = vec4(c, 1.0);
}
