/// @function		draw_setup(font, color, halign, valign);
/// @description 	Set the drawing parameters for the draw event
/// @param font		Font index
/// @param color	Color value
/// @param halign	Horizontal align
/// @param valign	Vertical align

// Examples
//	in the obj_game Draw Event:
//	draw_setup(fnt_pause_menu, c_white, fa_left, fa_top);
function draw_setup(argument0, argument1, argument2, argument3){
	
	/*
	the ??= operator means that if the param is empty, it will asign the specified default value
	*/
	argument0 ??= fnt_debug;
	argument1 ??= c_white;
	argument2 ??= -1;
	argument3 ??= -1;
	
	draw_set_font(argument0);
	draw_set_color(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);
}
