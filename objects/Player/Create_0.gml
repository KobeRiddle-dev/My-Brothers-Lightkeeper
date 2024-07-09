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
	var deltaY = verticalInput * self.movementSpeed * convertMicroSecondsToSeconds(delta_time);
	
	var willBeOnIsland = place_meeting(self.x + deltaX, self.y + deltaY, Island);
	if (willBeOnIsland)
	{
    	self.x += deltaX;
    	self.y += deltaY;
	}
}

Update = function()
{
    var horizontalInput = GetHorizontalInput();
    var verticalInput = GetVerticalInput();

    if (boatMode)
	{
        boat.Move(horizontalInput, verticalInput);
		x = boat.x;
		y = boat.y;
	}
    else
	{
        Move(horizontalInput, verticalInput);
	}
}


self.maps = [];

// TODO: move to somewhere other than the initialization of the player
gamepad_set_axis_deadzone(global.gamepadSlot, global.gamepadDeadzone);