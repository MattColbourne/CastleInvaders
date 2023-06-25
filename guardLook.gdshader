// NOTE: Shader automatically converted from Godot Engine 4.0.2.stable's CanvasItemMaterial.

shader_type canvas_item;
render_mode blend_mix,unshaded;

void fragment() {
	if (COLOR.b>0.0 && COLOR.r>0.0 && COLOR.g>0.0){
		COLOR.a = 0.6;
		}
}
