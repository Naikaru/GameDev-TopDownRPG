/// @description Draw Text on Screen

var _ww = 0.5 * w;
var _hh = 0.5 * h;

// css
draw_set_color(c_black);
draw_set_alpha(0.5);
// draw box
draw_roundrect_ext(x-_ww-border, y-border, x+_ww+border, y+h+border, 5, 5, false);
draw_sprite(sArrowDown, 0, x, y+h+border+1)
// draw text
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_transformed(x, y, currText, 1, 1, 0);
