/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Id.Instance.Region} region 

ScaleToRadius = function()
{
    // show_debug_message("region: " + object_geself.region));
    var currentRadiusMeters = PixelsToMeters(sprite_get_height(self.sprite_index));

    var scale = self.region.radiusMeters / currentRadiusMeters; 
    
    self.image_xscale = scale;
    self.image_yscale = scale;
}

ScaleToRadius();