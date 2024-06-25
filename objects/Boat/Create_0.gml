/// @description Insert description here
// You can write your code in this editor


/// @function
/// @param {Real} horizontalInput Between 0 and 1
/// @param {Real} verticalInput Between 0 and 1
Move = function(horizontalInput, verticalInput)
{
    self.x += horizontalInput * self.sailingSpeed;
    self.y += verticalInput * self.sailingSpeed;
}