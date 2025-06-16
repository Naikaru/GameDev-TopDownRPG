//@description Determine Loot

// Inherit the parent event
event_inherited();

// determines number of loot
if (dropQuantityRandom)
	dropQuantity = irandom(dropQuantity);

while (dropQuantity > 0)
{
	if (entityDropList[0] == -1)
	{
		entityDropList[0] = dropObject;
	}
	else
	{
		array_push(entityDropList, dropObject);
	}
	dropQuantity--;
}