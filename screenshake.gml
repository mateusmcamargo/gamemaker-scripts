/// @function        screenshake(magnitude, time, fade);
/// @description     Triggers a screenshake effect by setting the shake controller variables.
/// @param           {real} magnitude   The intensity of the screenshake.
/// @param           {real} time        Duration of the shake in steps.
/// @param           {real} fade        How quickly the shake effect fades out over time.
///
/// @returns         {bool}             Returns true if the shake was applied, false if no camera exists.
///
/// @example
/// // Light, quick shake
/// screenshake(4, 15, 0.9);
///
/// @example
/// // Strong, dramatic shake
/// screenshake(12, 60, 0.95);
///
/// @notes
/// - Requires an instance of 'obj_camera' to exist.
/// - Assumes a controller object (`obj_screenshake`) is handling the shake logic.
/// - Higher 'magnitude' = stronger shake.
/// - Higher 'fade' (closer to 1) = slower fade out.

function screenshake(magnitude, time, fade) {

    if (!instance_exists(obj_camera)) {return false;}

    with (obj_screenshake) {
        shake           = true;
        shake_magnitude = magnitude;
        shake_time      = time;
        shake_fade      = fade;
    }

    return true;
}
