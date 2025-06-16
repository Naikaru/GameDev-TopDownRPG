/// @description Camera Repositioning

if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x = lerp(x, xTo, camSmoothingFactor);
y = lerp(y, yTo, camSmoothingFactor);

// Clamping
x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

// Screen Shake
if (shakeRemain > 0 || shakeLength > 0)
{
	x += random_range(-shakeRemain, shakeRemain);
	y += random_range(-shakeRemain, shakeRemain);
	shakeLength--;
	shakeRemain = lerp(shakeRemain, 0, camSmoothingFactor);
	//shakeRemain = max(0, shakeRemain - ((1/shakeLength)*shakeMagnitude));
}

// Update camera position
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
