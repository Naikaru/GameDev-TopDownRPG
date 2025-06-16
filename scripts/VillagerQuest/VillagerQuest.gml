// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VillagerQuest()
{
	switch (questStep)
	{
		case 0:
		{
			// 0. First Talk nothing happens
			CreateTextBox("A mon grand age il m'est difficile pour moi de couper du bois...");
			questStep = 1;
			break;
		}
		case 1:
		{
			// 1. Starts the Quest
			questSubStep = 0;
			CreateTextBox("Jeune humanoid, accepteriez-vous de m'ecouter ?", ["1:Ecouter le vieil homme", "0:S'eloigner"]);
			// should activate script to questStep = 3 after completing dialog / subQuests
			break;
		}
		case 2:
		{
			// 2. Retrieve wood resources
			if (ds_map_exists(oPlayer.dsInventory, INVENTORY_WOOD) && oPlayer.dsInventory[? INVENTORY_WOOD] >= resourceQty[$ INVENTORY_WOOD])
			{
				CreateTextBox("Je vois que vous avez vite pris le coup de main !\nOu de hache devrais-je dire ho ho ho");
				CreateTextBox("Donnez-moi "+string(resourceQty[$ INVENTORY_WOOD])+" bois et je donnerai un arc en retour.", ["3:Accepter", "0:Refuser"]);
			}
			else
			{
				CreateTextBox("Si seulement j'avais encore la vigueur de ma jeunesse...");
				CreateTextBox("Rapportez-moi du bois jeune homme et je vous recompenserai.");
			}
			break;
		}
		case 3:
		{
			// 3. Retrieve stone resources
			if (ds_map_exists(oPlayer.dsInventory, INVENTORY_STONE) && oPlayer.dsInventory[? INVENTORY_STONE] >= resourceQty[$ INVENTORY_STONE])
			{
				CreateTextBox("Donnez-moi ces "+string(resourceQty[$ INVENTORY_STONE])+" pierres et je vous ferai des fleches.", ["4:Accepter", "0:Refuser"]);
			}
			else
			{
				CreateTextBox("Si seulement j'avais encore la vigueur de ma jeunesse...");
				CreateTextBox("Afin de realiser des fleches nous avons besoin de pierres.");
				CreateTextBox("Ramenez-moi 2 pierres et je vous ferai des fleches.");
			}
			break;
		}
		case 4:
		{
			CreateTextBox("Merci jeune humanoid !\nFaites attention aux creatures qui rodent !");
			CreateTextBox("Ramenez moi "+string(resourceQty[$ INVENTORY_WOOD])+" bois et 2 pierres et\nje vous fabriquerai de nouvelles fleches !");
			questStep = 5;
			break;
		}
		case 5:
		{
			if (	ds_map_exists(oPlayer.dsInventory, INVENTORY_WOOD)  && oPlayer.dsInventory[? INVENTORY_WOOD] >= resourceQty[$ INVENTORY_WOOD] 
				&&	ds_map_exists(oPlayer.dsInventory, INVENTORY_STONE) && oPlayer.dsInventory[? INVENTORY_STONE] >= resourceQty[$ INVENTORY_STONE]	)
			{
				CreateTextBox("Souhaitez-vous echanger votre bois et vos pierres\npour des fleches ?");
				CreateTextBox("", ["5:Donner "+string(resourceQty[$ INVENTORY_WOOD])+" bois et"+string(resourceQty[$ INVENTORY_STONE])+" pierres", "0: Refuser"]);
			}
			else
			{
				CreateTextBox("Le nombre de creatures rodant a augmente ces derniers temps...");
				CreateTextBox("Ramenez moi 10 bois et 2 pierres et\nje vous fabriquerai de nouvelles fleches !");
			}
			break;
		}
	}
}
