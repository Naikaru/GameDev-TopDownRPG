// set image_speed to 1
image_speed = 1;

// program next animation run
alarm_set(0,irandom_range(1,5)*game_get_speed(gamespeed_fps));
