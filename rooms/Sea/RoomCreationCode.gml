//foo

gamepad_set_axis_deadzone(global.gamepadSlot, global.gamepadDeadzone);

// reset the seed. Gamemaker is weird so you have to do that manually.
randomize();

global.solidObjects = [Storm, Fog];

global.dialogMode = false;