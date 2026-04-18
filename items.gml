/// @function        item_struct(name, sprite, object, collected, [ui_sprite]);
/// @description     Creates and returns a struct representing an item, for use in item arrays or systems.
/// @param           {string} name        The name/identifier of the item.
/// @param           {sprite} sprite      The in-game sprite of the item.
/// @param           {object} object      The object associated with the item.
/// @param           {bool}   collected   Whether the item has been collected.
/// @param           {sprite} [ui_sprite] Optional sprite used for UI display. Defaults to `noone`.
///
/// @returns         {struct}
///
/// @example
/// // In obj_game Create Event:
/// global.items = array_create(items_num);
/// global.items[0] = item_struct("diamond", spr_diamond, obj_diamond, false, spr_diamond_ui);
///
/// @example
/// // Without UI sprite (will default to noone)
/// global.items[1] = item_struct("coin", spr_coin, obj_coin, false);
///
/// @notes
/// - `ui_sprite` is optional and can be omitted if the item does not need a UI representation.
/// - This struct is useful for organizing item data in arrays, inventories, or save systems.

function item_struct(_name, _sprite, _object, _collected, _ui_sprite = noone) {

    return {
        name      : _name,
        sprite    : _sprite,
        object    : _object,
        collected : _collected,
        ui_sprite : _ui_sprite
    };
}
