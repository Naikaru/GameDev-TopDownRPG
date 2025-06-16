// When Player doesn't have the control over the character
if (global.gamePaused)
{
	exit;
}
else
{
//	flash = max(flash-1,0); // in actor pre-step
	invulnerable = max(invulnerable-1,0);
	canSwitchTool = max(canSwitchTool-1,0);
}


#region State Machine

switch (playerState)
{
	case PLAYER_STATE.FREE	: { PlayerFree();	break; }
	case PLAYER_STATE.ACTION: { PlayerAction(); break; }
	case PLAYER_STATE.HURT	: { PlayerHurt();	break; }
	case PLAYER_STATE.DIE	: { PlayerDie();	break; }
	case PLAYER_STATE.LOCKED: { }
}

#endregion

depth = -bbox_bottom;