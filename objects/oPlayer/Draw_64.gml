/// @description 

#region HP

var _xHP = 6;
var _yHP = 6;
var _offset = 3;
var _sHPStretch = 12;

for (var i = 0; i < global.playerMaxHealth; i++)
{
	var _imageIndex = i < global.playerHealth ? 0 : 1;
	var _xx = _xHP + i*(_sHPStretch + _offset);	
	draw_sprite_stretched(sHP, _imageIndex, _xx, _yHP, _sHPStretch, _sHPStretch);
	//draw_sprite(sHP, _imageIndex, _xx, _yHP)
}

#endregion

#region Tools

var _dsToolsSize = ds_list_size(dsTools);
if (_dsToolsSize > 0)
{
	var _sToolStretch = 20;
	var _xTool = display_get_gui_width() - 10 - _sToolStretch;
	var _yTool = display_get_gui_height() - 10 - _sToolStretch;
	var _offset = 10;
	for (var i = 0; i < _dsToolsSize; i++)
	{
		// x position to start drawing
		var _xx = _xTool - i*(_sToolStretch + _offset);

		// draw white rectangle around current tool
		if (currToolIndex == i)
		{
			draw_set_color(c_white);
			draw_set_alpha(0.5);
			draw_roundrect_ext(_xx-2, _yTool-2, _xx+_sToolStretch+2, _yTool+_sToolStretch+2, 5, 5, false);
			draw_set_color(c_black);
			draw_set_alpha(1);
		}
		// draw tool
		var _tool = ds_list_find_value(dsTools, i);
		var _sprite = _tool.sprite_index;
		draw_sprite_stretched(_sprite, 0, _xx, _yTool, _sToolStretch, _sToolStretch);
	}
}
#endregion


#region Inventory

// Draw Inventory Item Top Right
var _keys = ds_map_keys_to_array(dsInventory);
var _offset = 6;
var _itemStrech = 12;
var _itemX = display_get_gui_width() - 10 - _itemStrech;
var _itemY = _offset;

for (var _i = 0; _i < array_length(_keys); _i++)
{
	var _key = _keys[_i];
	var _sprite = global.gameInventory[$ _key].sprite;
	draw_sprite_stretched(_sprite, 0, _itemX, _itemY, _itemStrech , _itemStrech);
	draw_set_color(c_black);
	draw_set_font(fText);
	draw_text_transformed(_itemX+_itemStrech+2, _itemY+6, "x" + string(dsInventory[? _key]), 0.5, 0.5, 0);
	_itemY += (_itemStrech + _offset);
}


#endregion
