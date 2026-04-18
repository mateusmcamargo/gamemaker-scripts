# gamemaker-scripts 

A collection of reusable scripts for [GameMaker](https://gamemaker.io). 

Most of these were created for personal projects and game jams. Some are adapted from tutorials, while others are based on work by other developers (properly credited where applicable). 

> Documentation follows the [JSDoc standard](https://jsdoc.app), based on the official [GameMaker Docs](https://manual.gamemaker.io/beta/en/The_Asset_Editors/Code_Editor_Properties/JSDoc_Script_Comments.htm)

--- 

## animation_stop.gml

Stops a sprite animation either immediately or when it reaches the final frame.

### Structure
animation_stop(instant);

- instant {bool}
  If true, stops the animation immediately.
  If false, waits until the last frame before stopping.

--- 

## draw.gml
Sets common drawing parameters for use in the Draw event.

### Structure
draw_setup(font, color, halign, valign);

- font {font}
  Font used for drawing text.

- color {color}
  Drawing color.

- halign {real}
  Horizontal alignment (fa_left, fa_center, fa_right).

- valign {real}
  Vertical alignment (fa_top, fa_middle, fa_bottom).

--- 

## items.gml
Creates and returns a struct representing an item.

### Structure
item_struct(name, sprite, object, collected, [ui_sprite]);

- name {string}
  Item name or identifier.

- sprite {sprite}
  In-game sprite.

- object {object}
  Associated object.

- collected {bool}
  Whether the item has been collected.

- ui_sprite {sprite} (optional)
  Sprite used for UI display.

---

## screenshake.gml
Triggers a screenshake effect through a dedicated controller object.

### Structure
screenshake(magnitude, time, fade);

- magnitude {real}
  Intensity of the shake.

- time {real}
  Duration in steps.

- fade {real}
  How quickly the effect fades out.

---

## sprite_change.gml
Changes an object's sprite and ensures the animation restarts from the first frame at default speed.

### Structure
sprite_change(sprite);

- sprite {sprite}
  The new sprite to assign.
