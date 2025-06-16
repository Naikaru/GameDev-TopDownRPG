///@function			DropObjects(_x, _y, _objs)
///@param {real} _x		x position to drop
///@param {real} _y		y position to drop
///@param {Array} _objs	Objects to be dropped

function DropObjects(_x, _y, _objs)
{
	///@description	
	///handles items and loot and fragment instances creation

	var _nObjs = array_length(_objs);
	if (_nObjs > 0)
	{
		var _anglePerObj = 360/_nObjs;
		var _angle = random(360);
		for (var _i=0; _i<_nObjs; _i++)
		{
			with (instance_create_layer(_x,_y,"Instances",_objs[_i]))
			{
				direction = _angle;
				spd = 0.75 + (_nObjs * 0.1) + random(0.1);
			}
			_angle = (_angle + _anglePerObj) mod 360;
		}
	}
	else
	{
		instance_create_layer(_x,_y,"Instances",_objs[0]);
	}
}