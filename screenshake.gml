/// @function                  screenshake(magnitude, time, fade);
/// @description			   Set the screenshake variables.
/// @param  {real}  magnitude  The amount of screenshake to apply
/// @param  {real}  time       The length of time - in steps - to shake the screen
/// @param  {real}  fade       How quickly the screenshake effect will fade out
function screen_shake(argument0, argument1, argument2) {
	if (!instance_exists(obj_camera)) {return false}
	with (obj_screenshake) {
		shake           = true;
		shake_magnitude = argument0;
		shake_time      = argument1;
		shake_fade      = argument2;
	}
}
