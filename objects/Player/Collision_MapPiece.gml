/// @description Insert description here
// You can write your code in this editor

/// @type {Id.Instance.MapPiece} 
var mapPiece = other;
var parentMap = mapPiece.parentMap;
parentMap.AddFragment(mapPiece);
instance_destroy(mapPiece)

if (parentMap.IsComplete())
{
    instance_destroy(parentMap.region.lightHouse.storm);
}