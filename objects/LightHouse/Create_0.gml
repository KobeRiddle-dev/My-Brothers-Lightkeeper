/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Id.Instance.Region} region
/// @instancevar {Id.Instance.Storm} storm 

self.activated = false;

Update = function()
{
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