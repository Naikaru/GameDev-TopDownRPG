timer++;
y = y + fall_speed;

sway_base = sway_base + sway_randomness + wind_force;
x_offset = amplitude * sin(timer * frequency) + sway_base;
amplitude = clamp(amplitude + 0.5, 0, amplitude_max);

if (y > destroy_at_height) instance_destroy();
