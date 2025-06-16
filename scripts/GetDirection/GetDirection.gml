// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetDirection(_hmove, _vmove, _dir){
	// Direction
	if (_hmove > 0)
		return RIGHT;
	else if (_hmove < 0)
		return LEFT;

	if (_vmove > 0)
		return DOWN;
	else if (_vmove < 0)
		return UP;

	// On no movement return previous _dir
	return _dir;
}