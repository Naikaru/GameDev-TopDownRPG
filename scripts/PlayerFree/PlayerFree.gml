/// @function PlayerFree()

function PlayerFree()
{
	// PLAYER_STATE.FREE

	// User Inputs
	CheckInput();

	// Direction
	hmove = kRight - kLeft;
	vmove = kDown - kUp;
	playerDir = GetDirection(hmove, vmove, playerDir);

	// Move and Collide
	//var _speed = kRun ? runSpeed : wlkSpeed;
	var _speed = playerSpeed;
	var _direction = point_direction(0, 0, hmove, vmove);
	var _length = _speed * (hmove != 0 || vmove != 0);

	// scale horizontal and vertical movements 
	// according to input direction
	var _dx = lengthdir_x(_length, _direction);
	var _dy = lengthdir_y(_length, _direction);

	// Animation
	if (_length != 0)
	{
		direction = _direction;
	//	if (kRun)
	//		sprite_index = playerView[playerDir, PLAYER_STATE.RUN];
	//	else
	//		sprite_index = playerView[playerDir, PLAYER_STATE.WALK];
		sprite_index = playerView[playerDir, PLAYER_STATE.RUN];
	}
	else
	{
		sprite_index = playerView[playerDir, PLAYER_STATE.IDLE];
	}
	
	if (playerStatePrev != playerState)
	{
		// reset sprite index
		playerStatePrev = playerState;
		image_index = 0;
		image_speed = 1.0;
	}
		
	//moveX(_dx);
	//moveY(_dy);
	PlayerMoveCollide(_dx, _dy);
	
	// Check for activation
	if (keyActivate)
	{
		// 1. Check for an entity to activate
		// 2. If there is nothing or if there is something but without activate script : Action !
		// 3. Otherwise there is something and it has a script. Activate !
		// 4. If we activate an NPC, make it face towards us !

		// 1. Check for an entity to activate
		var _activateX = lengthdir_x(8, direction);
		var _activateY = lengthdir_y(8, direction);
		activate = instance_position(x+_activateX, y+_activateY, pEntity);
		
		// 2. If there is nothing or if there is something but without activate script : Action !
		if (activate == noone || activate.entityActivateScript == -1)
		{
			// Could be Rolling or Dashing
			if (actionCooldown <= 0) && (currToolIndex > -1)
			{
				playerState = PLAYER_STATE.ACTION;
			}
			// Other behavior
		}
		else
		{
			// 3. Otherwise there is something and it has a script. Activate !
			with (activate)
			{
				script_execute_ext(entityActivateScript, entityActivateArgs);
			}

			// 4. If we activate an NPC, make it face towards us !
			if instance_exists(activate) && (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x,y,other.x,other.y);
					// update sprite if sprite available for 4 directions npc
				}
			}
		}
	}

	// Check for tool change
	if (kSwitchToolNext && canSwitchTool <= 0)
	{
		if (currToolIndex != -1)
		{
			currToolIndex++;
			if (currToolIndex > ds_list_size(dsTools) - 1)
				currToolIndex = 0;
			tool = ds_list_find_value(dsTools, currToolIndex);
			canSwitchTool = switchToolCooldown;
		}
	}
	else if (kSwitchToolPrev && canSwitchTool <= 0)
	{
		if (currToolIndex != -1)
		{
			currToolIndex--;
			if (currToolIndex < 0)
				currToolIndex = ds_list_size(dsTools) - 1;
			tool = ds_list_find_value(dsTools, currToolIndex);
			canSwitchTool = switchToolCooldown;
		}		
	}
}