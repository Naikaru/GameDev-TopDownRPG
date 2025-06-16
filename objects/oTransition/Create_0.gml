/// @description Variables & Setup


enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

w = display_get_gui_width();
h = display_get_gui_height();

h_half = 0.5 * h;

mode = TRANS_MODE.INTRO;

col = c_black;
percent = 1.2;
target = room;


