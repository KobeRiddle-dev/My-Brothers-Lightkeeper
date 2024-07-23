/// @description Insert description here
// You can write your code in this editor

GetRandomXWithin = function()
{
    var xRandomOffset = irandom_range(-(self.sprite_width / 4), self.sprite_width / 4);
    return self.x + xRandomOffset;
}

GetRandomYWithin = function()
{
    var yRandomOffset = irandom_range(-(self.sprite_height / 4), self.sprite_height / 4);
    return self.y + yRandomOffset;
}