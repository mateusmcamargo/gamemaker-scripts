/// @description Collision
if (global.pause) {exit}

//horizontal
repeat(abs(hspd)) {
	var _hspd = sign(hspd);
	if (place_meeting(x + _hspd, y, tilemap_col)) {
		hspd = 0;
		break;
	} else {
		if (can_move) x += _hspd;	
	}
}

//vertical
repeat(abs(vspd)) {
	var _vspd = sign(vspd);
	if (place_meeting(x, y + _vspd, tilemap_col)) {
		vspd = 0;
		break;
	} else {
		y += _vspd;	
	}
}
