/// @description

if (!oscillate)
{
	// reach position
	y = lerp(y, yTo, 0.12);
	if (abs(y - yTo) < 0.001)
		oscillate = true;	
}

if (oscillate)
{
	// oscillations
	y = yTo + sin(get_timer()/500000)*1; // multiply by number of pixels to float
}