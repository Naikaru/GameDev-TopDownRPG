function HitTree()
{
	hp--;
	flash = 4;
	ScreenShake(1,5);
	image_index = 0;
	image_speed = 1.0;
	var _htop = bbox_top;
	var _hbot = bbox_bottom;
	var _nLeafs = 2*(3 - hp) + 1;
	while (_nLeafs > 0)
	{
		with (instance_create_layer(x+irandom_range(-10,10), _htop-irandom_range(10, 15), "Particules", oLeaf))
		{
			destroy_at_height = _hbot
		}
		_nLeafs--;
	}
	if (hp <= 0)
	{
		instance_destroy();
	}
}