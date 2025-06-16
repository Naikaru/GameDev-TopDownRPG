/// @description

if (!global.gamePaused) // in oActor
{
	flash = max(flash-1, 0);
	if (image_speed != 0)
	{
		gamePausedImageSpeed = image_speed;
	}
}
else
{
	gamePausedImageSpeed = image_speed;
	image_speed = 0;
}
