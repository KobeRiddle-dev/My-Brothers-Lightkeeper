/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Id.Instance.Region} region
/// @instancevar {Id.Instance.Storm} storm 

self.activated = false;

Activate = function()
{
    self.activated = true;

    instance_destroy(self.region.fog);
}