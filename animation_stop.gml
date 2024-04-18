/// @function		animation_stop(instant);
/// @description	Stops the object's image_speed
/// @param instant	If true, stops the animation instantly, instead of waiting for animation end

// Examples
//	in the object step event:
//	animation_stop(true); /*stops the animation instantly*/
//
//	in the object step event:
//	animation_stop(false); /*stops the animation and the end of the animation loop*/

function animation_stop(argument0) {

	/*
	the ??= operator means that if the param is empty, it will asign the specified value value
	*/
	argument0??= false;
	
	if (argument0 == true) {
		image_speed = 0;	
	} else {
		if (image_index >= image_number - 1) {
			image_index = image_number - 1;
			image_speed = 0
		}
	}
}
