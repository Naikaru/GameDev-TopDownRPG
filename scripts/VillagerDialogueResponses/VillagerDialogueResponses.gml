/// @function DialogueResponses

function VillagerDialogueResponses(_response)
{
	switch (_response)
	{
		case 0: break;
		case 1: 
		{
			CreateTextBox("Comme je suis vieux, je radote...\nA mon grand age il m'est difficile de couper du bois...");
 			CreateTextBox("Accepteriez-vous de couper ces arbres pour moi ?");
			CreateTextBox("Ramenez moi son bois, et je vous recompenserai !", ["2:Accepter", "0: Laisser le vieil homme radoter"]);
			break;
		}
		case 2:
		{
			CreateTextBox("Je vous confie ma hache !");
			instance_create_layer(x+16, y+16, "Player", oAxeSpawn);
			CreateTextBox("Ramenez moi une dizaine de bois et je vous recompenserai.");
			// update quest step
			questStep = 2;
			break;
		}
		case 3:
		{
			// Give Wood
			with (oPlayer)
			{
				dsInventory[? INVENTORY_WOOD] -= other.resourceQty[$ INVENTORY_WOOD];
			}
			CreateTextBox("Prenez cet arc, il vous aidera a vous defendre des creatures qui rodent.");
			instance_create_layer(x+16, y+16, "Player", oBowSpawn);
			CreateTextBox("Ramenez-moi 2 pierres et je vous ferai des fleches.");
			// update quest step
			questStep = 3;
			break;
		}
		case 4:
		{
			// Give Stone
			CreateTextBox("Prenez ces fleches, ca vous aidera a vous defendre des creatures qui rodent.");
			with (oPlayer)
			{
				dsInventory[? INVENTORY_STONE] -= other.resourceQty[$ INVENTORY_STONE];
				if (ds_map_exists(dsInventory, INVENTORY_ARROW))
				{
					dsInventory[? INVENTORY_ARROW] += other.resourceQty[$ INVENTORY_ARROW];
				}
				else
				{
					dsInventory[? INVENTORY_ARROW] = other.resourceQty[$ INVENTORY_ARROW];
				}
			}
			// update quest step
			questStep = 4;
			break;
		}
		case 5:
		{
			// Give Stone
			with (oPlayer)
			{
				dsInventory[? INVENTORY_WOOD] -= other.resourceQty[$ INVENTORY_WOOD];
				dsInventory[? INVENTORY_STONE] -= other.resourceQty[$ INVENTORY_WOOD];
				dsInventory[? INVENTORY_ARROW] += other.resourceQty[$ INVENTORY_ARROW];
			}
			CreateTextBox("Prenez cet arc, il vous aidera a vous defendre des creatures qui rodent.");
			CreateTextBox("Ramenez-moi 2 pierres et je vous ferai des fleches.");
			// update quest step
			questStep = 4;
			break;
		}

	}
}