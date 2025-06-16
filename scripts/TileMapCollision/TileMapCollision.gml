function TileMapCollision(_dx, _dy)
{
	var _collision = false;
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap,x+_dx,y))
	{
		 x -= x mod COLLISION_TILE_SIZE;
		 if (sign(_dx) == 1) 
			x += COLLISION_TILE_SIZE - 1;
		_dx = 0;
		_collision = true;
	}
	// Horizontal Move
	x += _dx;

	// Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap,x,y+_dy))
	{
		 y -= y mod COLLISION_TILE_SIZE;
		 if (sign(_dy) == 1) 
			y += COLLISION_TILE_SIZE - 1;
		_dy = 0;
		_collision = true;
	}
	// Horizontal Move
	y += _dy;
	
	return _collision;
}