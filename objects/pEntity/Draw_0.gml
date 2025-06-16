/// @description Insert description here

if (entityDrawShadow)
{
	draw_sprite(sShadow, 0, floor(x), floor(y));
}

// Shader flash effect
if (flash > 0) {
	shader_set(shWhite);
	shader_set_uniform_f(uFlash, flash);
	draw_self();
	shader_reset();
}

draw_self();