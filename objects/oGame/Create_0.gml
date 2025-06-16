/// @description 

// oTransition
if (not instance_exists(oTransition))
{
	instance_create_layer(0, 0, "Instances", oTransition);
}

// oCamera
if (not instance_exists(oCamera))
{
	instance_create_layer(0, 0, "Controllers", oCamera);
}

// oDraw
if (not instance_exists(oDraw))
{
	instance_create_layer(0, 0, "Controllers", oDraw);
}

// define globals
global.gamePaused = false;
global.textSpeed = 0.75;
global.playerMaxHealth = 3;
global.playerHealth = global.playerMaxHealth;
global.invulnerabilityFrames = 60;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

// inventory maps item with sprite to use
global.gameInventory = 
{
	INVENTORY_WOOD: 
	{
		maxQuantity: 20,
		sprite: sWood
	},
	INVENTORY_STONE:
	{
		maxQuantity: 20,
		sprite: sStone
	},
	INVENTORY_ARROW:
	{
		maxQuantity: 50,
		sprite: sArrow
	}

};
