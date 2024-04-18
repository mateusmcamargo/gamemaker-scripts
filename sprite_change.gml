/// @function		sprite_change(sprite);
/// @description	Changes the sprite of an object and makes sure the animation starts on the first frame white the default speed
/// @param sprite	The sprite index

// Examples
//	in the object step event:
//	sprite_change(spr_player_idle);
var _sprite = argument0;
function sprite_change(_sprite){
	if (sprite_index != _sprite) {
		image_index = 0;
		sprite_index = _sprite;
	}
	image_speed = 1;
}
