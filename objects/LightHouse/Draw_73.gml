/// @description Insert description here
// You can write your code in this editor

if (self.activated)
{
    show_debug_message("drawing triangle");
    draw_triangle_color(self.x, self.y, self.nextRegionId.x - MetersToPixels(16), self.nextRegionId.y - MetersToPixels(16), self.nextRegionId.x + MetersToPixels(16), self.nextRegionId.y + MetersToPixels(16), c_yellow, c_yellow, c_yellow, false);
}