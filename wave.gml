// credits to sara spalding
// https://www.youtube.com/@SaraSpalding
// https://pastebin.com/u/ShaunJS

/// @function        wave(from, to, duration, offset);
/// @description     Returns a value that smoothly oscillates between two values over time
/// @param from      The starting (minimum) value of the wave
/// @param to        The ending (maximum) value of the wave
/// @param duration  Time (in seconds) it takes to complete one full cycle
/// @param offset    Time offset multiplier to desync multiple wave instances

// examples
//  	image_angle = wave(-45, 45, 1, 0);
//  	x = wave(-10, 10, 0.25, 0);
// or here is a fun one! Make an object be all squishy!! ^u^
//  	image_xscale = wave(0.5, 2.0, 1.0, 0.0);
//  	image_yscale = wave(2.0, 0.5, 1.0, 0.0);

function wave(_from, _to, _duration, _offset) {

    /*
    Uses a sine wave to interpolate between two values.
    */

    var _half_range = (_to - _from) * 0.5;

    return _from + _half_range
        + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi * 2)) * _half_range;
}
