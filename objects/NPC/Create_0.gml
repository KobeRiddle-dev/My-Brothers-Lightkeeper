/// @description Insert description here
// You can write your code in this editor

Update = function()
{
}

CreateDialog = function()
{
    var camera = view_camera[0];

    var dialogBoxX = self.x; //camera_get_view_x(camera) + (display_get_width());
    var dialogBoxY = self.y; //camera_get_view_y(camera) + display_get_height();

    show_debug_message("Creating dialog at x:" + string(dialogBoxX) + " y: " + string(dialogBoxY));

    instance_create_layer(dialogBoxX, dialogBoxY, "Dialog", DialogBox);//, {phrases: ["Hey you! What are you doing here?!", "This is my island. Who let you on here?", "Since you seem nice enough, even though you aren’t answering me, I could put you to work.", "There’s a tall tale about some mystical piece of paper in a bottle around these isles, do you know anything about it?"]});
}