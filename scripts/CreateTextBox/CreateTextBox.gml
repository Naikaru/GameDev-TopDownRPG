function CreateTextBox(_text, _responses = [])
{
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		text = _text;
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		var _responsesLength = array_length(_responses)
		if (_responsesLength > 0)
		{	
			responseSelected = 0;
			for (var _i=0; _i<_responsesLength; _i++)
			{
				responses[_i]=_responses[_i]
				// trim markers
				var _markerPosition = string_pos(":", _responses[_i]);
				// retrieve script based on response format "x:Text"
				responseScripts[_i] = real(string_copy(_responses[_i], 1, _markerPosition-1));
				responses[_i] = string_delete(responses[_i], 1, _markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1]
		}
	}
	
	with (oPlayer)
	{
		if (playerState != PLAYER_STATE.LOCKED)
		{
			playerStatePrev = playerState;
			playerState = PLAYER_STATE.LOCKED;
		}
	}
}