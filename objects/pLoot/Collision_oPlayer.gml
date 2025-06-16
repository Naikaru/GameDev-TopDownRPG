/// @description Loot Object

// make oPlayer loot
var _lootName = lootName;
var _lootQty = lootQty;

with (other)
{
	// update current tool
	var _currQty = 0;
	if (ds_map_exists(dsInventory, _lootName))
	{
		_currQty = dsInventory[? _lootName];
	}
	dsInventory[? _lootName] = (_currQty + _lootQty)
	if (dsInventory[? _lootName] > global.gameInventory[$ _lootName].maxQuantity)
		dsInventory[? _lootName] = global.gameInventory[$ _lootName].maxQuantity;
}

// destroy
instance_destroy();

