/// @description Progress Text

if (running)
{
	letters += spd;
	currText = string_copy(text, 1, letters);
}
else
{
	currText = text;
	letters = length;
}

// css
draw_set_font(fText);
if (h == 0) h = string_height(text);
w = string_width(currText);

// destroy when done
//if ((letters >= length) && keyboard_check_pressed(vk_anykey))
//{
//	instance_destroy();
//}
