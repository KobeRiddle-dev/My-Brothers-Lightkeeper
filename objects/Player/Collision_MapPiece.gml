/// @description Insert description here
// You can write your code in this editor

/// @type {Id.Instance.MapPiece} 
var mapPiece = other;
var parentMap = mapPiece.parentMap;

audio_play_sound(SoundMapPickup, 1, false);
parentMap.AddFragment(mapPiece);
instance_destroy(mapPiece)

if (parentMap.IsComplete())
{
    audio_play_sound(SoundLighthouseLit, 5, false);
    instance_destroy(parentMap.region.lightHouse.storm);
}