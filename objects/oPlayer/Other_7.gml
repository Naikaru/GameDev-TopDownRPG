/// @description Action End

if (playerState == PLAYER_STATE.ACTION)
{
	// on action end, reset state to idle
	playerState = PLAYER_STATE.FREE;
	sprite_index = playerView[playerDir, PLAYER_STATE.IDLE];
	image_index = 0;	
	image_speed = 1.0;
	// Could be moved into script PlayerAction()
}