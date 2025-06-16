wind_force = 0;
timer = irandom_range(0, 100);

fall_speed = random_range(0.1, 0.3);
angle_rotation = choose(-3, -2, 2, 3);

sway_randomness = random_range(-0.5, 0.5);
sway_base = sway_randomness;

frequency = random_range(0.04, 0.07);
amplitude = random_range(1, 3);
amplitude_max = random_range(5, 10);

x_offset = amplitude * sin(timer * frequency) + sway_base;
destroy_at_height = room_height + 10;