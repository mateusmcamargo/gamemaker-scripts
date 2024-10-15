if (global.pause) {exit}
var _ground = place_meeting(x, y + 1, tilemap_col);

if (!_ground and vspd > 0) {
	vspd = 0;
	vspd -= jump_spd * .8;
	
	var _pitch = random_range(.8, 1.1);
	audio_play_sound(snd_enemy_crunch, 3, 0, 4, 0, _pitch);

	instance_create_layer(other.x, other.y, "Effects", obj_effect, {sprite_index: spr_dust_explosion});
	instance_destroy(other);
} else {
	instance_destroy();
}
