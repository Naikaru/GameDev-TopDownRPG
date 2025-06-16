// Inherit from parent
event_inherited()

#region init

// Run Player Init Script
PlayerInit();

playerDir = DOWN;
playerState = PLAYER_STATE.FREE;
playerStatePrev = playerState;
playerStateNext = playerState;
playerSpeed = 1.5;
hasControl = true;
hmove = 0;
vmove = 0;
knockback = 0;
hurtSpeed = 1.2;
invulnerable = 0;
canSwitchTool = 0;
switchToolCooldown = 10;
rangeAction = 0;
rangeActionCastDuration = 30;
z = 0;								// player height

// action tools
dsTools = ds_list_create();
tool = noone;
currToolIndex = -1;
actionCooldown = 0;
dsHitByAction = ds_list_create();
dsInventory = ds_map_create();

#endregion

#region utils

function DrawSelf()
{
	// On Invulnerability
	// 3 frames every 8 frames
	if (invulnerable > 0) && (invulnerable mod 8 < 3) && (flash == 0)
	{
		// skip draw		
	}
	else
	{
		// default
		draw_self();
		// On Hit
		if (flash > 0) {
			shader_set(onHitEffect);
			draw_self();
			shader_reset();
		}
	}
}

// override of parent oActor squash() function
function squash() {	
    instance_create_depth(x, y, -1, oPlayerSquash);
    instance_destroy(id);
}

#endregion