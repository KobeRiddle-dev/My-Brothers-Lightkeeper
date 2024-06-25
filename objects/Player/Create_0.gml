/// @description Creates the player
// You can write your code in this editor

/// @function
/// @param {Real} microSeconds
/// @return {Real} seconds
/// @description Converts
function convertMicroSecondsToSeconds(microSeconds)
{
	return microSeconds / 1_000_000;
}


/// @function
/// @param {Real} horizontalInput Between 0 and 1
/// @param {Real} verticalInput Between 0 and 1
Move = function(horizontalInput, verticalInput)
{
	show_debug_message("moving player. movementSpeed: " + string(self.movementSpeed));
	var deltaX = horizontalInput * self.movementSpeed * convertMicroSecondsToSeconds(delta_time);
    self.x += deltaX;
	
	var deltaY = verticalInput * self.movementSpeed * convertMicroSecondsToSeconds(delta_time);
    self.y += deltaY;
}


Update = function()
{
    var horizontalInput = GetHorizontalInput();
    var verticalInput = GetVerticalInput();
    var interactDown = IsInteractInputDown();

    if (boatMode)
	{
		// TODO: Move the boat's movement call into the boat's update function
        boat.Move(horizontalInput, verticalInput);
		x = boat.x;
		y = boat.y;
	}
    else
	{
        Move(horizontalInput, verticalInput);
	}
}

// TODO: move to somewhere other than the initialization of the player
gamepad_set_axis_deadzone(global.gamepadSlot, global.gamepadDeadzone);