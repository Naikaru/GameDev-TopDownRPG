// Ignore on game pause
if (global.gamePaused)
{
	exit;
}

// Bounce Count
if (bounceCount != 0)
{
	bounce += (pi * bounceSpeed);
	// touching the ground
	if (bounce > pi)
	{
		// reset bounce
		bounce -= pi;
		// decreasing bounce height
		bounceHeight *= 0.6;
		// decrease bounce count
		bounceCount--;
	}
	z = abs(sin(bounce) * bounceHeight);
}
else
{
	z = 0;
}

// Deteriorate
deteriorate++;
if (deteriorate > deteriorateAfter)
{
	image_alpha -= 1/deteriorateTime;
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}

// Friction
frict = (z == 0 ? 0.10 : 0.05);

// Move
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (tilemap_get_at_pixel(collisionMap, x, y))
{
	spd = 0.0;
}
// apply friction
spd = max(spd - frict, 0.0);
