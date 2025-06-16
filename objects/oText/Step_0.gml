/// @description Progress Text

x1 = lerp(x1, x1Target, 0.12);
x2 = lerp(x2, x2Target, 0.12);

if (running)
{
	textProgress += global.textSpeed;
	currText = string_copy(text, 1, textProgress);
}
else
{
	currText = text;
	textProgress = textLength;
}

if (keyboard_check_pressed(vk_space))
{
	if (textProgress >= string_length(text))
	{
		if ((responses[0] != -1) && (originInstance != noone))
		{
			// text caller
			with (originInstance)
			{
				// execute entity dialog response script
				// pass response index in args
				script_execute(entityDialogResponses, other.responseScripts[other.responseSelected])
			}
		}
		
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;
		}
		else
		{
			global.gamePaused = false;
			with (oPlayer)
			{
				playerState = playerStatePrev;
			}
		}
	}
	else
	{
		if (textProgress > 2)
		{
			// complete text
			textProgress = string_length(text);
		}
	}
}

if (textProgress >= string_length(text) && responses[0] != -1)
{
	// Cycle through responses
	kDown	= keyboard_check_pressed(vk_down)	||	keyboard_check_pressed(ord("S"));
	kUp		= keyboard_check_pressed(vk_up)		||	keyboard_check_pressed(ord("Z"));

	responseSelected += kDown - kUp;
	var _responsesLength = array_length(responses);
	if (responseSelected >= _responsesLength) responseSelected = 0;
	if (responseSelected < 0) responseSelected = _responsesLength - 1;	
}