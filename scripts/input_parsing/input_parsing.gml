/// A Script for parsing input

global.upKey = ord("W");
global.downKey = ord("S");
global.leftKey = ord("A");
global.rightKey = ord("D");

global.interactKey = ord("F");
global.backKey = ord("X");

global.gamepadSlot = 0;
global.gamepadDeadzone = 0.1;

global.gamepadHorizontalAxis = gp_axislh;
global.gamepadVerticalAxis = gp_axislv;

global.gamepadInteractButton = gp_face3;
global.gamepadBackButton = gp_face2;

/// @function
/// @description Gets the vertical input
function GetVerticalInput()
{
    var verticalInput = GetKeyboardVerticalInput();

    var gamepadVertical = gamepad_axis_value(global.gamepadSlot, global.gamepadVerticalAxis);
    if (gamepadVertical != 0)
	{
        verticalInput = gamepadVertical;
	}

    // show_debug_message("vertical input: " + string(verticalInput));

    return verticalInput;
}

function GetKeyboardVerticalInput()
{
    var verticalInput = 0;

    if (keyboard_check(global.upKey))
    {
        verticalInput -= 1;
    }

    if (keyboard_check(global.downKey))
    {
        verticalInput += 1;
    }
	
	return verticalInput;
}


function GetHorizontalInput()
{
    var horizontalInput = 0;

    if (keyboard_check(global.rightKey))
    {
        horizontalInput += 1;
    }
    
    if (keyboard_check(global.leftKey))
    {
        horizontalInput -= 1;
    }

    var gamepadHorizontal = gamepad_axis_value(global.gamepadSlot, global.gamepadHorizontalAxis);
    if (gamepadHorizontal != 0)
        horizontalInput = gamepadHorizontal;

    // show_debug_message("horizontal input: " + string(horizontalInput));

    return horizontalInput;
}

function IsInteractInputDown()
{
    var interactInputDown = global.timeSinceLastInput >= global.inputCoolDownSeconds && (keyboard_check(global.interactKey) 
    || gamepad_button_check(global.gamepadSlot, global.gamepadInteractButton));

    // show_debug_message("interact input down: " + string(interactInputDown))
	
	if (interactInputDown)
	{
		global.timeSinceLastInput = 0;
	}
    return interactInputDown;
}

global.inputCoolDownSeconds = 0.1;
global.timeSinceLastInput = 0;

function IsBackInputDown()
{
    var backInputDown = global.timeSinceLastInput >= global.inputCoolDownSeconds && (keyboard_check(global.backKey) || gamepad_button_check(global.gamepadSlot, global.gamepadBackButton));
	
	if (backInputDown)
	{
		global.timeSinceLastInput = 0;
	}

	return backInputDown;
}