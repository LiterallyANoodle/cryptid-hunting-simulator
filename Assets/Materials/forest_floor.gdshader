shader_type spatial;

uniform float amplitude = 1.0;
uniform sampler2D noise_img;
uniform sampler2D normal_map;
uniform vec3 base_color : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX.y = (amplitude * texture(noise_img, UV).r) - (amplitude * 0.5);
}

void fragment() {
	NORMAL_MAP = texture(normal_map, UV).xyz;
	ALBEDO = (base_color * texture(noise_img, UV).r);
}
