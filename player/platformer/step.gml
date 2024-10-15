#region Pause

if (global.pause) {image_speed = 0; can_move = false; exit} else {image_speed = 1; can_move = true}

#endregion

#region VARIABLES AND INPUTS

var _left, _right, _jump, _jump_d, _duck, _up, _down, //inputs
    _move, _ground, _wall, _block_in, _ladder,				  //collisions
	_list, _rand, _pitch;							  //sounds	

//inputs
_left   = input_check("left");
_right  = input_check("right");
_duck   = input_check("duck");
_jump   = input_check_pressed("jump");
_jump_d = input_check("jump");
_up     = input_check("up");
_down   = input_check("down");

//solids
_ground = place_meeting(x, y + 1, tilemap_col);
_wall   = place_meeting(x + sign(hspd), y, tilemap_col);
_ladder = place_meeting(x, y, obj_ladder);

//get the tilemap index
var _lay_id = layer_get_id("Platforms");
var _map_id = layer_tilemap_get_id(_lay_id);
	
var _b = 8 * sign(image_xscale);
var _x = x - _b;
	
var _x      = tilemap_get_cell_x_at_pixel(_map_id, x, y);
var _y      = tilemap_get_cell_y_at_pixel(_map_id, x, y + 1);
var _data   = tilemap_get(_map_id, _x, _y);	
	
//if player is not in a tile, store the last tile in a variable
if (_data != 0) {
	tile_map_index = tile_get_index(_data);
	tile_map_index_new = tile_map_index;
} else {
	tile_map_index = tile_map_index_new;
}

//tilemap arrays
var _grass = [115, 116, 117,   175, 176, 177, 178];
var _dirt  = [110, 111, 112,   170, 171, 172, 173];
var _metal = [190, 191, 192,   250, 251, 252, 253];
var _stone = [195, 196, 197,   255, 256, 257, 258];

#endregion

#region MOVEMENT

if (can_move) {
	//define var move and check if it isnt 0
	_move = _right - _left != 0;
	
	//gravity and ladder
	if (!_ladder) {vspd += (GRAVITY * mass)} else {
		state = "ladder";
		vspd = 0;
		hspd = 0;
	}

	//check if falling
	if (vspd > 0 and !_ground and state != "duck" and state != "pickup") {state = "fall"}
	
	//jump buffer and coyote time
	if (_ground) {coyote_time = coyote_time_default} else {coyote_time --}
	if (_jump)   {jump_buffer = jump_buffer_default}
	jump_buffer --;
	
	//limiting jump speed (dynamic jump)
	if (!_jump_d and vspd < 0 and state != "fall" and state != "pickup") {
		vspd = max(vspd, -jump_spd / 2.2);
	}
	
	//jump
	if (jump_buffer > 0 and coyote_time > 0 and !_ladder and state != "pickup") {

		//changes state and resets variables
		if (!_ground) {
			state = "fall"
		} else {
			state = "jump";
			var _rand = irandom_range(5, 10);
			part_particles_create(obj_particle.part_system, x, y, obj_particle.part_jump_left,  _rand);
			part_particles_create(obj_particle.part_system, x, y, obj_particle.part_jump_right, _rand);
		}
		coyote_time = 0;
		jump_buffer = 0;
		vspd = 0;
		
		//jumps
		vspd -= jump_spd;
		
		//stores the coordinates when the jump is started, purely for debug reasons
		xstart_jump = x;
		ystart_jump = y;
		
		//jump audio
		var _pitch = random_range(.8, 1.2);
		if (!audio_is_playing(snd_jump)) {
			audio_play_sound(snd_jump, 3, 0, 1, 0, _pitch);
		}
	}

	//checks if moving
	if (_move) {
		dir = point_direction(0, 0, _right - _left, 0);
		hspd = max_hspd;
	} else {
		hspd = 0;
	}

	//horizontal movement
	hspd = lengthdir_x(hspd, dir);
	if (hspd != 0) {image_xscale = sign(hspd)}
}

//limit variables
vspd        = clamp(vspd, -max_vspd, max_vspd/2);
jump_buffer = clamp(jump_buffer, 0, jump_buffer_default);

#endregion

#region STATE MACHINE

switch(state) {
	
	case "idle":
		sprite_change(spr_player_idle);
		
		if (_up)   {sprite_change(spr_player_look_up)}
		if (_move) {state = "run"}
		if (_duck) {state = "duck"}
	break;

	case "run":
		sprite_change(spr_player_run);
		
		//particles
		part_particles_create(obj_particle.part_system, x, y, obj_particle.part_run, 1);
		
		//sound	
		for (var _i = 0; _i < array_length(_grass); _i ++) {
			if (tile_map_index == _grass[_i]) {
				_list  = global.audio_list_sfx_run_grass;
				_rand  = audio_list_get_random(_list);
				_pitch = random_range(1.3, 1.5);
				if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
			}
		}
		for (var _i = 0; _i < array_length(_stone); _i ++) {
			if (tile_map_index == _stone[_i]) {
				_list  = global.audio_list_sfx_run_concrete;
				_rand  = audio_list_get_random(_list);
				_pitch = random_range(1.3, 1.5);
				if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
			}
		}
		for (var _i = 0; _i < array_length(_metal); _i ++) {
			if (tile_map_index == _metal[_i]) {
				_list  = global.audio_list_sfx_run_metal;
				_rand  = audio_list_get_random(_list);
				_pitch = random_range(1.3, 1.5);
				if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
			}
		}
		for (var _i = 0; _i < array_length(_dirt);  _i ++)  {
			if (tile_map_index == _dirt[_i]) {
				_list  = global.audio_list_sfx_run_carpet;
				_rand  = audio_list_get_random(_list);
				_pitch = random_range(1.3, 1.5);
				if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
			}
		}

		if (!_move) {state = "idle"}
		if (_duck)  {state = "duck"}
		
	break;
	
	case "duck":
		sprite_change(spr_player_duck);
		
		hspd = 0;
		
		if (vspd >= 3) {state = "fall"}
		if (!_duck)    {state = "idle"}
	break;

	case "jump":
		sprite_change(spr_player_jump);
		image_speed = 0;
		image_index = 0;

		if (_ground and vspd > 0)   {state = "idle"; image_speed = 1}
	break;
	
	case "fall":
		sprite_change(spr_player_jump);
		image_speed = 0;
		image_index = 0;
		
		if (_ground) {
			state = "idle"; image_speed = 1;
			//var _s = spr_dust_land;
			//instance_create_layer(x, y, "Effects", obj_effect,{sprite_index: _s,image_xscale: 1});
			//instance_create_layer(x, y, "Effects", obj_effect,{sprite_index: _s,image_xscale: -1});
			
			//particles
			var _rand = irandom_range(5, 10);
			part_particles_create(obj_particle.part_system, x-5, y, obj_particle.part_land_left,  _rand);
			part_particles_create(obj_particle.part_system, x+5, y, obj_particle.part_land_right, _rand);
			
			//sound
			for (var _i = 0; _i < array_length(_grass); _i ++) {
				if (tile_map_index == _grass[_i]) {
					_list  = global.audio_list_sfx_land_grass;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_stone); _i ++) {
				if (tile_map_index == _stone[_i]) {
					_list  = global.audio_list_sfx_land_concrete;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_metal); _i ++) {
				if (tile_map_index == _metal[_i]) {
					_list  = global.audio_list_sfx_land_metal;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_dirt);  _i ++) {
				if (tile_map_index == _dirt[_i]) {
					_list  = global.audio_list_sfx_land_carpet;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
		
		}
		if (vspd < 0) {state = "jump"			for (var _i = 0; _i < array_length(_grass); _i ++) {
				if (tile_map_index == _grass[_i]) {
					_list  = global.audio_list_sfx_land_grass;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_stone); _i ++) {
				if (tile_map_index == _stone[_i]) {
					_list  = global.audio_list_sfx_land_concrete;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_metal); _i ++) {
				if (tile_map_index == _metal[_i]) {
					_list  = global.audio_list_sfx_land_metal;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}
			for (var _i = 0; _i < array_length(_dirt);  _i ++) {
				if (tile_map_index == _dirt[_i]) {
					_list  = global.audio_list_sfx_land_carpet;
					_rand  = audio_list_get_random(_list);
					_pitch = random_range(.8, .6);
					if (!audio_group_is_playing(_list)) {audio_play_sound(_rand.id, 1, 0, 1, 0, _pitch)}
				}
			}}
	break;
	
	case "ladder":
		//sprite_change(spr_player_ladder);
		vspd = (_down - _up) * max_hspd;
		
		if (!_ladder) {state = "idle"}
	break;
	
	case "pickup":
		sprite_change(spr_player_pickup);
		can_move = false;
		
		timer_diamond --;
		if (timer_diamond <= 0) {timer_diamond = default_timer_diamond; instance_destroy(obj_diamond); state = "idle"}
	break;
}

#endregion

#region DEBUG



#endregion
