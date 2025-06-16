///@function PlayerDie()

function PlayerDie()
{
	// Init
	if (playerStatePrev != playerState)
	{
		playerStatePrev = playerState;
		// unique sprite
		sprite_index = sPlayerDie;
		image_index = 0;
		image_speed = 0.0; // /!\ image_speed at one while player is "mid-air" because of knockback
	}
	
	// Apply Knockback
	if (knockback > 0)
	{
		var _xTo = x - lengthdir_x(knockback, hitfrom);
		var _yTo = y - lengthdir_y(knockback, hitfrom);
	
		var _distTo = point_distance(x,y,_xTo,_yTo);
		if (_distTo > playerSpeed)
		{
			var _dx = lengthdir_x(playerSpeed, hitfrom);
			var _dy = lengthdir_y(playerSpeed, hitfrom);

			// since we have only one frame sprite
			if (_dx != 0) image_xscale = sign(_dx);

			// move player
			var _collision = PlayerMoveCollide(_dx, _dy);
		
			// stop player
			if (_collision)
			{
				// stop knockback
				knockback = 0;
			}
			else
			{
				knockback = max(0, knockback - playerSpeed);
			}
		}
		else
		{
			// end knockback
			knockback = 0;
			// apply resuming distance
			var _dx = lengthdir_x(playerSpeed, hitfrom);
			var _dy = lengthdir_y(playerSpeed, hitfrom);
			PlayerMoveCollide(_dx, _dy);
		}
	}
	else
	{
		// restore image_speed
		image_speed = 1.0;
	}

	if (image_index > image_number - 1)
	{
		image_index = image_number - 1;
		SlideTransition(TRANS_MODE.RESTART, room);
	}
}