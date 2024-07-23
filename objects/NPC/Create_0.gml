/// @description Insert description here
// You can write your code in this editor

Update = function()
{
}

CreateDialog = function()
{
    var camera = view_camera[0];

    var dialogBoxX = camera_get_view_x(camera);
    var dialogBoxY = camera_get_view_y(camera);

    show_debug_message("Creating dialog at x:" + string(dialogBoxX) + " y: " + string(dialogBoxY));

    instance_create_layer(dialogBoxX, dialogBoxX, "Dialog", DialogBox);
}