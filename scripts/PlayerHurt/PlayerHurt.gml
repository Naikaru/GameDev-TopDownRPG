///@function PlayerHurt()

function PlayerHurt()
{
	// PLAYER_STATE.HURT

	// Init
	if (playerStatePrev != playerState)
	{
		playerStatePrev = playerState;
		if (direction >= -45 && direction < 45)
		{
			playerDir = RIGHT;
		}
		else if (direction >= 45 && direction < 135)
		{
			playerDir = UP;
		}
		else if ((direction >= 135 && direction < 225) || (direction >= -135 && direction < -45))
		{
			playerDir = LEFT;
		}
		else
		{
			playerDir = DOWN;
		}
		sprite_index = playerView[playerDir, PLAYER_STATE.HURT];
		image_index = 0;
		image_speed = 0.0; // /!\ image_speed at one while player is "mid-air" because of knockback
	}

	// Knockback
	var _dx = lengthdir_x(hurtSpeed, hitfrom);
	var _dy = lengthdir_y(hurtSpeed, hitfrom);
	
	// move player
	var _collision = PlayerMoveCollide(_dx, _dy);
	// remaining knockback
	knockback = max(0, knockback - hurtSpeed);

	// Change Height
	//z = sin((knockback / hurtDistance) * pi) * hurtDistanceHeight;

	if (knockback <= 0)
	{
		// restore image_speed
		image_speed = 1.0;
		// reset state to FREE		
		playerState = PLAYER_STATE.FREE;
	}
	
}