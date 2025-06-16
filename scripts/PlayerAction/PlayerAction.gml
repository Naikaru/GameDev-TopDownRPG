/// @function PlayerAction();

function PlayerAction()
{
	// TODO: inheritance with range items / melee items
	if (tool.object_index == oBow)
	{
		PlayerActionRange();
	}
	else
	{
		PlayerActionMelee();
	}
}

function PlayerActionMelee()
{
	// Action
	var _action = noone;
	var _toolObjId = tool.object_index;
	if (_toolObjId == oSword)
		_action = PLAYER_ACTION.ATTACK;
	else if (_toolObjId == oAxe)
		_action = PLAYER_ACTION.CHOP;
	else if (_toolObjId == oPickAxe)
		_action = PLAYER_ACTION.DIG;
	else if (_toolObjId == oBow)
		_action = PLAYER_ACTION.RANGE_ATTACK;

	// Init
	if (playerStatePrev != playerState)
	{
		// start of the action
		hmove = 0;
		vmove = 0;
		playerStatePrev = playerState;
		// update sprite
		sprite_index = playerActionView[playerDir, _action];
		image_index = 0;
		image_speed = 1.0;
		// clean hit ds_list
		ds_list_clear(dsHitByAction);
	}

	
	var _mask = playerActionHBMask[playerDir, _action];
	PlayerActionMeleeApply(_action, _mask);
	
	// On Animation End reset playerState
}

function PlayerActionMeleeApply(_action, _mask)
{
	mask_index = _mask;
	var _hitByAction = ds_list_create();
	var _hits = instance_place_list(x, y, pEntity, _hitByAction, false);
	if (_hits > 0)
	for (var i = 0; i < _hits; i++)
	{
		// if instance hasn't been hit by this attack
		// var _hitId = ds_list_find_value(_hitByAction, i);
		var _hitId = _hitByAction[| i];
		if (ds_list_find_index(dsHitByAction, _hitId) == -1)
		{
			ds_list_add(dsHitByAction, _hitId);
			with (_hitId)
			{
				// enemy can be hit by any tool
				if (object_is_ancestor(object_index, oEnemy))
				{
					HitEnemy(id, other.id, other.tool.damage, other.tool.knockback);
				}
				else if (_action == PLAYER_ACTION.CHOP && object_is_ancestor(object_index, pChoppable) && entityHitScript != -1)
				{
					script_execute(entityHitScript);
				}
				else if (_action == PLAYER_ACTION.DIG && object_is_ancestor(object_index, pDigable) && entityHitScript != -1)
				{
					script_execute(entityHitScript);
				}
				//else if (_action == PLAYER_ACTION.ATTACK && entityHitScript != -1)
				//{
				//	script_execute(entityHitScript);
				//}
			}
		}
	}
	// clean up
	ds_list_destroy(_hitByAction);
	// reset player collision mask
	mask_index = sPlayerIdleDown;
}

function PlayerActionRange()
{
	// RangeAction duration
	rangeAction--;
	
	// Init
	if (playerStatePrev != playerState)
	{
		// start of the action
		// Player
		rangeAction = rangeActionCastDuration;
		hmove = 0;
		vmove = 0;
		playerStatePrev = playerState;
		sprite_index = playerView[playerDir, PLAYER_STATE.IDLE];
		image_index = 0;	
		image_speed = 0.0;

		// Bow
		var _spriteIndex = 0;
		var _x = x;
		var _y = y;
		switch (playerDir)
		{
			case DOWN:	
			{
				_spriteIndex = 6; 
				_y += 10;
				break;
			}
			case LEFT:	
			{
				_spriteIndex = 4;
				_x -= 10;
				break;
			}
			case RIGHT: 
			{
				_spriteIndex = 0; 
				_x += 10;
				break;
			}
			case UP	:	
			{
				_spriteIndex = 2; 
				_y -= 10;
				break;
			}
		}
		with (instance_create_layer(x,y,"Player",oPlayerBow))
		{
			image_index = _spriteIndex;
			xTo = _x;
			yTo = _y;
			alarm_set(0, other.rangeActionCastDuration);
		}
		if (ds_map_exists(dsInventory, INVENTORY_ARROW) && dsInventory[? INVENTORY_ARROW] > 0)
		{
			dsInventory[? INVENTORY_ARROW] -= 1;
			with (instance_create_layer(_x,_y,"Player",oPlayerArrow))
			{
				mask_index = sPlayerArrowHB;
				image_index = _spriteIndex;
				hmove = sign(_x-other.x);
				vmove = sign(_y-other.y);
			}
		}
	}

	if (rangeAction <= 0)
	{
		// on action end, reset state to idle
		playerState = PLAYER_STATE.FREE;
	}
}

function HitEnemy(_enemy, _source, _damage, _knockback)
{
	with (_enemy)
	{
		if (enemyState != ENEMY_STATE.DIE)
		{
			hp -= _damage;
			flash = 4;
			
			// hurt or die
			if (hp <= 0)
			{
				enemyState = ENEMY_STATE.DIE;
			}
			else
			{
				if (enemyState != ENEMY_STATE.HURT)
				{	
					enemyStatePrev = enemyState;
					enemyState = ENEMY_STATE.HURT
				}
			}
			
			// anim
			image_index = 0;
			if (_knockback > 0)
			{
				var _knockDirection = point_direction(x, y, _source.x, _source.y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);				
			}
		}
	}
}