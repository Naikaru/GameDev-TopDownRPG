/// @description Progress the Transition

// on TRANS_MODE.OFF do nothing
if (mode == TRANS_MODE.OFF)
{
	exit; // interrupt step
}

// on TRANS_MODE.INTRO slide out, otherwise slide in
if (mode == TRANS_MODE.INTRO)
{
	percent = max(0, percent - max((percent/10), 0.005));
}
else
{
	percent = min(1.2, percent + max(((1.2 - percent)/10), 0.005));
}

if ((percent == 0) or (percent == 1.2))
{
	switch (mode)
	{
		case TRANS_MODE.INTRO:
		{
			mode = TRANS_MODE.OFF;
			break;
		}
		case TRANS_MODE.NEXT:
		{
			mode = TRANS_MODE.INTRO;
			room_goto_next();
			break;
		}
		case TRANS_MODE.GOTO:
		{
			mode = TRANS_MODE.INTRO;
			room_goto(target);
			break;
		}	
		case TRANS_MODE.RESTART:
		{
			game_restart();
			break;
		}	
	}	
}