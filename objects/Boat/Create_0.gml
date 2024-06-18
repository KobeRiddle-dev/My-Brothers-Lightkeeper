/// @description Insert description here
// You can write your code in this editor

self.sailingSpeed = 20;

Move = function(horizontalInput, verticalInput)
{
    self.x += horizontalInput * self.sailingSpeed;
    self.y += verticalInput * self.sailingSpeed;
}