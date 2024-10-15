//audio listener
audio_listener_orientation(0, 0, 1000, 0, -1, 1000);

//tiles
tilemap_col = layer_tilemap_get_id("Platforms");
var _lay_id = layer_get_id("Platforms");
var _map_id = layer_tilemap_get_id(_lay_id);
var _x		= tilemap_get_cell_x_at_pixel(_map_id, x, y);
var _y		= tilemap_get_cell_y_at_pixel(_map_id, x, y + 1);
var _data	= tilemap_get(_map_id, _x, _y);

tile_map_index     = tile_get_index(_data);
tile_map_index_new = tile_map_index;

//jump debug
xstart_jump = xstart;
ystart_jump = ystart;

//particles
default_timer_create_dust = 10;
timer_create_dust = default_timer_create_dust;

//diamond
default_timer_diamond = 100;
timer_diamond = default_timer_diamond;
