/// @description 

image_speed = 0;
image_index = image_number - 1;

with (instance_create_layer(x, y+10, "Player", loot))
{
	depth = -(other.bbox_bottom + 1);
}
