/// @function				move_collide(dx, dy, obj, [numIterations]);
/// @param {Real} dx		The x component of direction to move in.
/// @param {Real} dy		The y component of direction to move in.
/// @param {Asset.GMObject} obj	The object to check for collisions with.
/// @param {Real} numIterations	The number of steps the motion will be broken down into to resolve collisions. Default to 4.
/// @return {Boolean}		Wheither or not a collision has been encountered			

// TODO: Improve the function so that it would return an array 
// containing the IDs of the instances and tile maps it collided with.

function MoveCollide(_dx, _dy, _obj, _numIterations = 4)
{	
	var _collision = false;
	/// @description	With this function you can tell an instance to move in a direction 
	///					and resolving collisions on the way.
	///					Returns the array of instances it has been colliding with.

	// move_and_collide(_dx, _dy, _obj, _numIterations);
	// TODO: improve this function to accept Array.

	// Horizontal Obj Collisions
	if place_meeting(x + _dx, y, _obj)
	{
		_collision = true;
		while(not place_meeting(x + sign(_dx), y, _obj))
		{
			x += sign(_dx);			
		}
		_dx = 0;
	}
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap,x+_dx,y))
	{
		 x -= x mod COLLISION_TILE_SIZE;
		 if (sign(_dx) == 1) 
			x += COLLISION_TILE_SIZE - 1;
		_dx = 0;
		_collision = true;
	}

	// Vertical Obj Collisions
	if place_meeting(x, y + _dy, _obj)
	{
		_collision = true;
		while(not place_meeting(x, y + sign(_dy), _obj))
		{
			y += sign(_dy);
		}
		_dy = 0;
	}
	// Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap,x,y+_dy))
	{
		 y -= y mod COLLISION_TILE_SIZE;
		 if (sign(_dy) == 1) 
			y += COLLISION_TILE_SIZE - 1;
		_dy = 0;
		_collision = true;
	}

	// update positions
	x += _dx;
	y += _dy;
	
	return _collision;
}
