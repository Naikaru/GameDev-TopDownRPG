/// @function screen_shake(magnitude, frames);
/// @param {real} _magnitude : shake strength (shift from original position)
/// @param {real} _frames : number of frames to shake

function ScreenShake(_magnitude = 1.0, _frames = 60.0) 
{
	with (oCamera) 
	{
		// resets only on higher magnitudes
		if (_magnitude > shakeRemain)
		{
			shakeMagnitude = _magnitude;
			shakeLength = _frames;
			shakeRemain = _magnitude;
		}
	}
}