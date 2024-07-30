/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Id.Instance.Region} region
/// @instancevar {Id.Instance.Storm} storm 

self.activated = false;

Update = function()
{
    if (self.activated)
    {
        show_debug_message("drawing triangle");
        draw_triangle_color(self.x, self.y, self.nextRegionId.x - MetersToPixels(16), self.nextRegionId.y - MetersToPixels(16), self.nextRegionId.x + MetersToPixels(16), self.nextRegionId.y + MetersToPixels(16), c_yellow, c_yellow, c_yellow, false);
    }
}

Activate = function()
{
    if (!self.activated)
    {
        audio_play_sound(SoundFogLifted, 5, false);
        instance_destroy(self.region.fog);
        self.region.CreateNextRegion();
    }
    self.activated = true;
}