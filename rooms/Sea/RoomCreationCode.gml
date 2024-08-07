//foo

// TODO: move to somewhere other than the initialization of the player
gamepad_set_axis_deadzone(global.gamepadSlot, global.gamepadDeadzone);

// reset the seed. Gamemaker is weird so you have to do that manually.
randomize();

// TODO: You can't add lighthouse because you need to interact with it -- fix?
global.solidObjects = [Storm, Fog];

global.dialogMode = false;