// Inherit the parent event
event_inherited();

/// @description Parent Actor

#region init

// movement variables
hp = maxHp;
spd = 0;
xRemainder = 0;
yRemainder = 0;
gamePausedImageSpeed = 0;

// interactions
flash = 0;
hitfrom = 0;
recoil = 0;

#endregion


#region utils

function DrawSelf(){
	// Default
	draw_self();

	// On Hit
	if (flash > 0) {
		shader_set(onHitEffect);
		draw_self();
		shader_reset();
	}
}

//default action when actor collides with a solid (halt actor movement)
function collideX() {
	spd = 0;
	xRemainder = 0;
}

function collideY() {
	spd = 0;
	yRemainder = 0;
}
	
	/// @function isRiding(solid)
	/// @param {Asset.GMObject} _solid	instance of moving solid colliding with actor
	/// @return {Boolean}	Returns True or false
	function isRiding(_solid) {
		/// @description
		/// Used by solid to detect if an actor is riding it
		/// Add additional returns here for more riding actions like clinging, wall sliding, etc.
		
		if (typeof(_solid) != oSolid)
		{
			throw ("oActor.isRiding() expects oSolid instances).");
		}

		//optional check for player wall clinging
		if (clinging && cling_inst == _solid.id) { return true };
		
		// Don't change or remove these
		//actor is on top
		if (place_meeting(x, y+1, _solid)) { return true };
		//actor is underneath
		if (place_meeting(x, y-1, _solid) && sign(_solid.yspd) == 1) { return true };
		//actor is moving the same direction horizontally as a moving solid (moving faster than the solid)
		return (place_meeting(x+sign(_solid.xspd), y, _solid) && sign(xspd) == sign(_solid.xspd)); 
	}	
	
	//default action to execute when actor is squashed between two solids
	function squash() {

	}

#endregion


#region move and collide

// https://maddythorson.medium.com/celeste-and-towerfall-physics-d24bd2ae0fc5
/// @function MoveX(dx, onCollide)
/// @param {Real} _dx				Amount of movement to apply in x direction.
/// @param _onCollide	Action to perform on collision. Detroy instance by default.
function moveX(_dx, _onCollide =  function () { collideX() })
{
	xRemainder += _dx;				// add the movement amount to our "remainder" counter
	var _move = floor(xRemainder)	// move when the rounded remainder is non-zero
	
	if (_move != 0)
	{
		xRemainder -= _move;
		var _sign = sign(_move);

		while (_move != 0)
		{
			if (!place_meeting(x + _sign, y, oSolid))
			{
				// there is no Solid immediately beside us
				x += _sign;
				_move -= _sign;
			}
			else
			{
				// hit a solid
				if (_onCollide() != noone)
					_onCollide();
				break;
			}
		}
	}
	
}

function moveY(_dy, _onCollide =  function () { collideY() })
{
	yRemainder += _dy;				// add the movement amount to our "remainder" counter
	var _move = floor(yRemainder)	// move when the rounded remainder is non-zero
	
	if (_move != 0)
	{
		yRemainder -= _move;
		var _sign = sign(_move);

		while (_move != 0)
		{
			if (!place_meeting(x, y + _sign, oSolid))
			{
				// there is no Solid immediately beside us
				y += _sign;
				_move -= _sign;
			}
			else
			{
				// hit a solid
				if (_onCollide() != noone)
					_onCollide();
				break;
			}
		}
	}
	
}
#endregion

#region Health Bar

function ShowHealthBar()
{
	if (hp < maxHp && hp > 0)
	{
		draw_healthbar(x-7, y-16, x+7, y-14, hp/maxHp*100, $004e00, $3232FF, $00B200, 0, 1, 0);
	}
}

#endregion

