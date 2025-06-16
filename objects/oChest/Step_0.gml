/// @description Text Indication

if (closed && point_in_circle(oPlayer.x, oPlayer.y, x, y, dist))
{
	if (textBox == noone)
	{		
		textBox = instance_create_layer(x, y-40, "Instances", oTextBox)
		textBox.text = "Open";
	}
}
else
{
	if (textBox != noone)
	{
		instance_destroy(textBox); 
		textBox = noone;
	}
}
