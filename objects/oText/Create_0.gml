x1 = RESOLUTION_W/2;
y1 = RESOLUTION_H-70;
x2 = RESOLUTION_W/2;
y2 = RESOLUTION_H;

x1Target = 0;
x2Target = RESOLUTION_W;

offset = 20;
currText = "";
textProgress = 0;
running = true;
background = 0; // which background to use for the text box

// Following variables are defined in CreateTextBox() and 
// must not be overwritten during instance_change of oTextQueued

// originInstance = id; // which instance has triggered the dialog
// text = "Default message text";
// responses = [-1];
// responseSelected = 0;
// responsesScript = [-1];

global.gamePaused = true;