/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} radiusMeters


ScaleToRadius = function()
{
    var currentRadiusMeters = PixelsToMeters(sprite_get_height(self.sprite_index));

    var scale = self.radiusMeters / currentRadiusMeters; 
    
    self.image_xscale = scale;
    self.image_yscale = scale;
}

self.image_alpha = 0.75;
self.ScaleToRadius();