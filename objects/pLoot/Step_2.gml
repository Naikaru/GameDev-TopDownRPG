/// @description Override

flash = max(0, flash-0.05);
frict = (z == 0 ? 0.10 : 0.05);

// Magnetize Loot effect

if (instance_exists(oPlayer))
{
	// Check if player in radius
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,16))
	{
		// acceleration
		spd += 0.25;
		spd = min(spd, 3);
		// goes towards player
		direction = point_direction(x,y,oPlayer.x,oPlayer.y);
		frict = 0;
	}
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
spd = max(spd-frict, 0);
depth = -bbox_bottom;