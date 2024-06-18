/// @description Creates the player
// You can write your code in this editor

self.movementSpeed = 20;
self.boatMode = false;
self.boat = undefined;

Move = function(horizontalInput, verticalInput)
{
    self.x += horizontalInput * self.movementSpeed;
    self.y += verticalInput * self.movementSpeed;
}

// TODO: move to somewhere other than the initialization of the player
gamepad_set_axis_deadzone(global.gamepadSlot, global.gamepadDeadzone);