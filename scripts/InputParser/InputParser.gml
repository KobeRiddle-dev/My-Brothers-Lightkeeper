/// A Script for parsing input

global.up_key = ord("w");
global.down_key = ord("s");
global.left_key = ord("a");
global.right_key = ord("d");

global.interact_key = ord("f");

global.gamepad_slot = 0;

global.gamepad_horizontal_input = gp_axislh;
global.gamepad_vertical_input = gp_axislv;

global.gamepad_interact_button = gp_face3;

/// @function
/// @description
function get_vertical_input()
{
    var vertical_input = 0;

    if (keyboard_check_pressed(global.up_key))
        vertical_input += 1;
    
    if (keyboard_check_pressed(global.down_key))
        vertical_input -= 1;

    var gamepad_vertical = gamepad_axis_value(global.gamepad_slot, global.gamepad_horizontal_input);

    if (gamepad_vertical != 0)
        vertical_input = gamepad_vertical;

    return vertical_input;
}

function get_horizontal_input()
{
    var horizontal_input = 0;

    if (keyboard_check_pressed(global.up_key))
        horizontal_input += 1;
    
    if (keyboard_check_pressed(global.down_key))
        horizontal_input -= 1;

    var gamepad_horizontal = gamepad_axis_value(global.gamepad_slot, global.gamepad_horizontal_input);

    if (gamepad_horizontal != 0)
        horizontal_input = gamepad_horizontal;

    return horizontal_input;
}

function get_interaction_input_pressed()
{
    return keyboard_check_pressed(global.interact_key) 
        || gamepad_button_check_pressed(global.gamepad_slot, global.gamepad_interact_button);
}