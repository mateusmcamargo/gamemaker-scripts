/// @function        draw_setup(font, color, halign, valign);
/// @description     Sets common drawing parameters for text rendering in the Draw event.
/// @param           {font}  font     The font to use. Defaults to `fnt_debug` if undefined.
/// @param           {color} color    The draw color. Defaults to `c_white` if undefined.
/// @param           {real}  halign   Horizontal alignment (e.g., `fa_left`, `fa_center`, `fa_right`). Optional.
/// @param           {real}  valign   Vertical alignment (e.g., `fa_top`, `fa_middle`, `fa_bottom`). Optional.
///
/// @returns         {void}
///
/// @example
/// // Basic usage in Draw Event
/// draw_setup(fnt_pause_menu, c_white, fa_left, fa_top);
///
/// @example
/// // Use defaults (debug font + white color)
/// draw_setup();
///
/// @notes
/// - If `halign` or `valign` are undefined, they will not be changed.
/// - Useful for centralizing draw state setup and avoiding repetitive code in Draw events.

function draw_setup(font = fnt_debug, color = c_white, halign = -1, valign = -1){
	
	// 
	// this is deprecated
	// the ??= operator means that if the param is empty, it will asign the specified default value
	// 
	// argument0 ??= -1;
	// argument1 ??= c_white;
	// argument2 ??= -1;
	// argument3 ??= -1;
	
	draw_set_font(font);
	draw_set_color(color);
	draw_set_halign(halign);
	draw_set_valign(valign);
}
