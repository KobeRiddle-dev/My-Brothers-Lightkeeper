/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} sailingSpeed;
/// @instancevar {Any} foo 

/// @function
/// @param {Real} horizontalInput Between 0 and 1
/// @param {Real} verticalInput Between 0 and 1
Move = function(horizontalInput, verticalInput)
{
	var deltaX = horizontalInput * self.sailingSpeed;
	var deltaY = verticalInput * self.sailingSpeed;
	
	var willBeInWater = !place_meeting(self.x + deltaX, self.y + deltaY, Island);
	if (willBeInWater)
	{
		self.x += deltaX;
		self.y += deltaY;
	}

}