if (global.pause) {image_speed = 0; exit} else {image_speed = 1}

var _buffer = (sprite_width*sign(hspd))/3;

if (place_meeting(x + sign(hspd), y, tilemap_col) or !place_meeting(x + _buffer, y + 1, tilemap_col)) {hspd = -hspd}
x += hspd;
