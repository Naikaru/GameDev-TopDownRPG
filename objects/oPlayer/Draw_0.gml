/// @description Draw Player

// Inherit the parent event
draw_sprite(sShadow, 0, floor(x), floor(y));


// On Invulnerability
// 3 frames every 8 frames
if (invulnerable > 0) && (invulnerable mod 8 < 3) && (flash == 0)
{
	// skip draw		
}
else
{
	// On Hit
	if (flash > 0) {
		shader_set(onHitEffect);
		var _uFlash = shader_get_uniform(onHitEffect, "flash");
		shader_set_uniform_f(_uFlash, flash);
	}
	// Draw with Height
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
	if (shader_current() != -1)
	{
		shader_reset();
	}
}