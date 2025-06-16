/// @description 

draw_sprite_stretched(sTextBox, 0, x1, y1, x2-x1, y2-y1);

// text
 if (textProgress > string_length(text)) && (responses[0] != -1)
{
	for (var _i=0; _i<array_length(responses); _i++)
	{
		currText += "\n";
		if (responseSelected == _i)
			currText += "> ";
		currText += responses[_i];
		if (responseSelected == _i)
			currText += " <";
	}
}
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_ext(RESOLUTION_W/2, RESOLUTION_H-60, currText, 16, RESOLUTION_W-30);
//draw_text_transformed(RESOLUTION_W, RESOLUTION_W-70-offset, currText, 5, 5, 0);