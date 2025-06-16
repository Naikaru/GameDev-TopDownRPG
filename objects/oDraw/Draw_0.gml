/// @description Draw Controller

if (ds_exists(dsDepthGrid, ds_type_grid))
{
	// Sort the Grid by Y value ascending
	ds_grid_sort(dsDepthGrid, 1, true);

	// Draw all of the instances in order (lowest Y value first)
	for (var yy = 0; yy < ds_grid_height(dsDepthGrid); yy++)
	{
		// draw the instance
		var _instanceID = dsDepthGrid[# 0, yy]
		with (_instanceID)
		{
			if (object_is_ancestor(object_index, pActor))
			{
				DrawSelf();
			}
			else
			{
				draw_self();
			}
		}
	}
	
	ds_grid_destroy(dsDepthGrid);
}