/// @description Creates the player
// You can write your code in this editor

/// @instancevar {Real} movementSpeed
/// @instancevar {Id.Instance.Boat} boat 
/// @instancevar {Any} foo 


/// @function
/// @param {Real} horizontalInput Between 0 and 1
/// @param {Real} verticalInput Between 0 and 1
Move = function(horizontalInput, verticalInput)
{
	
	// show_debug_message("moving player. movementSpeed: " + string(self.movementSpeed));
	var deltaX = horizontalInput * MetersToPixels(self.movementSpeed) * convertMicroSecondsToSeconds(delta_time);
	var deltaY = verticalInput * MetersToPixels(self.movementSpeed) * convertMicroSecondsToSeconds(delta_time);
	
	var willBeOnIsland = place_meeting(self.x + deltaX, self.y + deltaY, Island);
	var willCollideWithSolidObject = place_meeting(self.x + deltaX, self.y + deltaY, global.solidObjects);
	if (willBeOnIsland)
	{
    	self.x += deltaX;
    	self.y += deltaY;
	}
}

Update = function()
{
    global.timeSinceLastInput += convertMicroSecondsToSeconds(delta_time);
	// show_debug_message("time since last input: " + string(global.timeSinceLastInput));

	if (global.dialogMode)
	{
		return;
	}

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
