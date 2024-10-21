function shader_shine() {

// This is the script that contains the create, step, and draw code
switch (global.event_type) {
	
	case ev_create:
		// Create code goes here
		shine_x	= x - sprite_width;
		shine_y = y + sprite_height;

		default_timer_shine = 100;
		timer_shine = default_timer_shine;
	break;
	
	case ev_step:
		// Step code goes here
		timer_shine --;

		if (timer_shine <= 40) {
			shine_x = lerp(shine_x, shine_x + sprite_width,  .04);
			shine_y = lerp(shine_y, shine_y - sprite_height, .04);
		}
		if (timer_shine <= 0) {
			timer_shine = default_timer_shine;
			shine_x	    = x - sprite_width;
			shine_y     = y + sprite_height;
		}
	break;
	
	case ev_draw:
		// Draw code goes here
		draw_sprite(spr_diamond, 0, x, y);

		gpu_set_blendenable(false)
		gpu_set_colorwriteenable(false, false, false, true);
		draw_set_alpha(0);
		draw_rectangle(0, 0, room_width, room_height, false);

  // the mask sprite should be the same size as the object sprite,with the area to be shinny painted white and the area to be matte transparent 
		draw_set_alpha(1);
		draw_sprite(spr_diamond_mask, 0, x, y);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(true, true, true, true);

		gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
		gpu_set_alphatestenable(true);


		draw_sprite(spr_shine, 0, shine_x, shine_y);
		gpu_set_alphatestenable(false);
		gpu_set_blendmode(bm_normal);
	break;
	
		default:
			// Handle other events if needed
		break;
	}

}
