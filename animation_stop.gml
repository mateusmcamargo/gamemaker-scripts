/// @function		animation_stop(instant);
/// @description	Stops the current sprite animation, either immediately of at the end of the loop.
/// @param 			{bool} 	instant	If true, stops the animation instantly. If false, waits until the last frame to stop.
///
/// @returns 		{void}
///
/// @example
/// // Stop animation instantly
/// animation_stop(true);
///
/// @example
/// // Let animation finish before stopping
/// animation_stop(false);
///
/// @notes
/// - When `instant` is false, the animation will continue playing until it reaches the final frame,
///   then freeze on that frame.
/// - Useful for ensuring animations (like attacks or transitions) complete before stopping.

function animation_stop(_instant) {

	// this is deprecated
	// the ??= operator means that if the param is empty, it will asign the specified value value
	// argument0??= false;

    // default parameter value (modern replacement for deprecated ??= operator)
    if (is_undefined(_instant)) {
        _instant = false;
    }
	
	if (_instant == true) {
		image_speed = 0;	
	} else {
		if (image_index >= image_number - 1) {
			image_index = image_number - 1;
			image_speed = 0
		}
	}
}
