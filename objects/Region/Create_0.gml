/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} regionNumber
self.regionNumber;
/// @instancevar {Real} numberSideIslands
self.numberSideIslands;
/// @instancevar {Id.Layer} islandLayer
self.islandLayer;
/// @instancevar {Real} islandRadiusMeters 
self.islandRadiusMeters;
/// @instancevar {Id.Instance.Map} map
self.map;
/// @instancevar {Id.Instance.LightHouse} lightHouse
self.lightHouse;
/// @instancevar {Asset.GMObject.Island} lightHouseIsland
self.lightHouseIsland;

/// @type{Array<Real>}
self.islands = [];

/// @type{Real}
self.radius = 0;

/// @param {Real} xOffsetPixels
/// @param {Real} yOffsetPixels
/// @param {Asset.GMObject.Island} islandType
CreateIsland = function(xOffsetPixels, yOffsetPixels, islandType)
{
	return instance_create_layer(self.x + xOffsetPixels, self.y + yOffsetPixels, self.islandLayer, islandType)
	
}

CalculateRadius = function()
{
	return MetersToPixels(self.numberSideIslands * 64);
}

CreateLightHouseIsland = function()
{
	return instance_create_layer(self.x, self.y, self.islandLayer, self.lightHouseIsland);
}

CreateIslands = function()
{
	for (var i = 1; i <= self.numberSideIslands; i++)
	{
		var randomOffsetMeters = self.islandRadiusMeters / 16;

		var xOffsetPixels = self.islandRadiusMeters + islandRadiusMeters;
		var yOffsetPixels = 10 * i;
		
		var islandName = "Island" + "R" + string(self.regionNumber) + "I" + string(i);
		show_debug_message("islandName: " + islandName);
		var islandType = asset_get_index(islandName);
		show_debug_message(object_get_name(islandType));
		
		var newIsland = CreateIsland(xOffsetPixels, yOffsetPixels, islandType);
		array_push(self.islands, newIsland);	
	}
}

self.radius = self.CalculateRadius();
self.CreateLightHouseIsland();
self.CreateIslands();
