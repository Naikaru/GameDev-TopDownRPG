bounce = 0;
deteriorate = 0;
z = 0;
spd = 0.5;
frict = 0;

image_speed = 0.0;
image_index = irandom(image_number-1);
image_xscale = choose(-1, 1);

collisionMap = layer_tilemap_get_id(layer_get_id("Collisions"));

direction = random(360);