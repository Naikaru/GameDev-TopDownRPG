///@description Add to depth grid

function AddToDepthGrid()
{
	with (oDraw)
	{	
		if (!ds_exists(dsDepthGrid, ds_type_grid))
		{
			// create the depth grid datastructure
			dsDepthGrid = ds_grid_create(2, 1); // two columns, 1 row;

			// add ID to the grid
			dsDepthGrid[# 0, 0] = other;
 		
			// add Y value to the grid
			dsDepthGrid[# 1, 0] = other.y;
		}
		// resize current grid
		var _dsHeight = ds_grid_height(dsDepthGrid);		
		ds_grid_resize(dsDepthGrid, 2, _dsHeight+1);
			
		// add ID to the grid
		dsDepthGrid[# 0, _dsHeight] = other;
 		
		// add Y value to the grid
		dsDepthGrid[# 1, _dsHeight] = other.y;
	}
}