///@function CheckInput()

function CheckInput()
{
	// keyboard
	kLeft	= keyboard_check(vk_left)	||	keyboard_check(ord("Q"));
	kRight	= keyboard_check(vk_right)	||	keyboard_check(ord("D"));
	kDown	= keyboard_check(vk_down)	||	keyboard_check(ord("S"));
	kUp		= keyboard_check(vk_up)		||	keyboard_check(ord("Z"));
	kSpace	= keyboard_check_pressed(vk_space);
	kRun	= keyboard_check(vk_shift);
	kSwitchToolNext	= keyboard_check(ord("C"));
	kSwitchToolPrev = keyboard_check(ord("X"));

	// mouse
	mbLeft = mouse_check_button(mb_left);
	mbRight = mouse_check_button(mb_right);
	
	// activation key
	keyActivate = kSpace || mbLeft;
}