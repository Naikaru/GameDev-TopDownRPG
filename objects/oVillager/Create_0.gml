/// @description Insert description here

// Inherit the parent event
event_inherited();

// animation
alarm_set(0,irandom_range(3,10)*game_get_speed(gamespeed_fps));

// variables
questStep = 0;
resourceQty = {
	INVENTORY_WOOD: 5,
	INVENTORY_STONE: 1,
	INVENTORY_ARROW: 10
}
