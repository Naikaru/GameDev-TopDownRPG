/// @description Instance Destroy

if (hit)
{
	instance_destroy();
}

if (x < -offset || x > display_get_gui_width() + offset || 
	y < -offset || y > display_get_gui_height() + offset)
{
	instance_destroy();
}
