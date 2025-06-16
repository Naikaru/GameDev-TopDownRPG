/// @function PickUpLoot(_tool)
/// @param {Asset.GMObject} _tool Object to pickup

function PickupTool(_tool)
{
	/// Executed by ToolSpawn instances

	// Make oPlayer get a new tool item
	with (oPlayer) 
	{
		// update current tool
		tool = instance_create_layer(x, y, "Player", _tool);
		// add to tools list
		ds_list_add(dsTools, tool);
		// update tool index in list
		currToolIndex = ds_list_size(dsTools) - 1;
	}
	instance_destroy();	
}