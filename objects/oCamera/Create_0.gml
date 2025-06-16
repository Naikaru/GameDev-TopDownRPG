/// @description Set up Camera

// Get camera
cam = view_get_camera(0);

// Get display sizes
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

// Init vars
xTo = xstart;
yTo = ystart;
camSmoothingFactor = 0.12;
follow = oPlayer;

// Screen Shake
shakeMagnitude = 0;
shakeLength = 0;
shakeRemain = 0;
