/// @function				move_collide(dx, dy, obj, [numIterations]);
/// @param {Real} dx		The x component of direction to move in.
/// @param {Real} dy		The y component of direction to move in.
/// @param {Asset.GMObject} obj	The object to check for collisions with.
/// @param {Real} numIterations	The number of steps the motion will be broken down into to resolve collisions. Default to 4.
/// @return {Boolean}		Wheither or not a collision has been encountered			

// TODO: Improve the function so that it would return an array 
// containing the IDs of the instances and tile maps it collided with.

function PlayerMoveCollide(_dx, _dy)
{	
	var _collision = false;
	/// @description	With this function you can tell an instance to move in a direction 
	///					and resolving collisions on the way.
	///					Returns the array of instances it has been colliding with.

	// move_and_collide(_dx, _dy, _obj, _numIterations);
	// TODO: improve this function to accept Array.


	// Horizontal Obj Collisions
	// List of entities we collision with
	var _entityList = ds_list_create();
	var _entityCount = instance_position_list(x+_dx,y,pEntity,_entityList,false);
	for (var _i=0; _i<_entityCount; _i++)
	{
		//var _entity = _entityList[|_i];
		var _entity = _entityList[|0];
		// check for _collision
		if (_entity.entityCollision)
		{
			_collision = true;
			// move as close as we can
			if (sign(_dx) == -1)
				x = _entity.bbox_right + 1;	
			else
				x = _entity.bbox_left - 1;	
			_dx = 0;
			// no need to check for other collisions
			break;
		}
	}
	// clean up
	ds_list_destroy(_entityList);

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
	// List of entities we collision with
	_entityList = ds_list_create();
	_entityCount = instance_position_list(x,y+_dy,pEntity,_entityList,false);
	for (var _i=0; _i<_entityCount; _i++)
	{
		var _entity = _entityList[|_i];
		// check for _collision
		if (_entity.entityCollision)
		{
			_collision = true;
			// move as close as we can
			if (sign(_dy) == -1)
				y = _entity.bbox_bottom + 1;
			else
				y = _entity.bbox_top - 1;	
			_dy = 0;
			// no need to check for other collisions
			break;
		}
	}
	// clean up
	ds_list_destroy(_entityList);

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
