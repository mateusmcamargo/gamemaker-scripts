/// @function		sprite_change(sprite);
/// @description	Changes the sprite of an object and makes sure the animation startsat the given frame with the default speed
/// @param sprite	The sprite index
/// @param index	The starting frame of the animation (default = 0)

// Examples
//	in the object step event:
//	sprite_change(spr_player_idle, 1);

var _sprite = argument0;
var _index  = argument1;
function sprite_change(_sprite, _index){
	
	_index ??= 0;
	
	if (sprite_index != _sprite) {
		image_index   = _index;
		sprite_index  = _sprite;
	}
	image_speed = 1;
}
