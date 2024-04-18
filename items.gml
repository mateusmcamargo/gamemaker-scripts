/// @function		 item_struct(name, sprite, object, collected, [ui_sprite])
/// @description	 Returns a struct of the item, so that it can be created on the items array
/// @param name		 Name of the item
/// @param sprite	 Sprite of the item
/// @param object	 Object of the item
/// @param collected The variable that checks if the item is collected
/// @param ui_sprite Sprite of the item drawn in the ui 

// Examples
//	in the obj_game Create Event:
//
//	global.items = array_create[items_num];
//	items[0] = item_struct("diamond", spr_diamond, obj_diamond, global.diamond, spr_diamond_ui);
function item_struct(argument0, argument1, argument2, argument3, argument4) {
	
	argument4??= noone
	
	var _struct = {
		name     : argument0,
		sprite   : argument1,
		object   : argument2,
		collected: argument3,
		ui_sprite: argument4
	}
	
	return _struct;
}
