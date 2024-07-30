/// @description Insert description here
// You can write your code in this editor

if (self.activated)
{
    var offset = MetersToPixels(self.region.radiusMeters / 2);

    // show_debug_message("drawing triangle");
    draw_triangle_color(self.x, self.y - MetersToPixels(8), 
    self.nextRegionId.x - MetersToPixels(1) - offset, self.nextRegionId.y + offset, 
    self.nextRegionId.x + MetersToPixels(1) - offset, self.nextRegionId.y + MetersToPixels(1) + offset, 
    c_yellow, c_yellow, c_yellow, false);
}