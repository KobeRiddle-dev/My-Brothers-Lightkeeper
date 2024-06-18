/// @description Updates the player object each frame.
// You can write your code in this editor


function update()
{
    var horizontal_input = get_horizontal_input();
    var vertical_input = get_vertical_input();
    move(horizontal_input, vertical_input);
}

function move(horizontal_input, vertical_input)
{
    self.hspeed = horizontal_input * self.movement_speed;
    self.vspeed = vertical_input * self.movement_speed;
}




update();