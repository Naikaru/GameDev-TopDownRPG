/// @description 

// make oPlayer loot
if (oscillate)
{
	with (other)
	{
		// update current tool
		tool = instance_create_layer(x, y, "Player", other.tool);
		// add to tools list
		ds_list_add(dsTools, tool);
		// update tool index in list
		currToolIndex = ds_list_size(dsTools) - 1;
	}
	instance_destroy();
}