/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} regionNumber
/// @instancevar {Real} numberSideIslands
/// @instancevar {Id.Layer} islandLayer
/// @instancevar {Real} islandRadiusMeters 
/// @instancevar {Id.Instance.Map} map
/// @instancevar {Id.Instance.LightHouse} lightHouse
/// @instancevar {Asset.GMObject.Island} lightHouseIsland
/// @instancevar {Any} foo 

/// @type{Array<Real>}
self.islands = [];

/// @type{Real}
self.radius = 0;

/// @param {Real} xOffsetPixels
/// @param {Real} yOffsetPixels
/// @param {Asset.GMObject.Island} islandType
/// @returns {Id.Instance.Island} 
CreateIsland = function(xOffsetPixels, yOffsetPixels, islandType)
{
	var creationX = self.x + xOffsetPixels;
	var creationY = self.y + yOffsetPixels;

	show_debug_message("creating island at x: " + string(creationX) + ", y: " + string(creationY) + ", type: " + object_get_name(islandType));
	return instance_create_layer(creationX, creationY, self.islandLayer, islandType)
	
}

/// @returns {Id.Instance.Island} 
CreateLightHouseIsland = function()
{
	show_debug_message("creating lightHouse Island at x: " + string(self.x) + ", y: " + string(self.y) + ", type: " + object_get_name(self.lightHouseIsland));
	return instance_create_layer(self.x, self.y, self.islandLayer, self.lightHouseIsland);
}

CreateIslands = function()
{
	// reset the seed. Gamemaker is weird so you have to do that manually.
	randomize();
	
	var xFactors = [-1, 0, 1, -1, 1, -1, 0, 1];
	var yFactors = [-1, -1, -1, 0, 0, 1, 1, 1]

	for (var i = 0; i < self.numberSideIslands; i++)
	{
		// Get island position
		var factorIndex = irandom_range(0, array_length(xFactors) - 1);
		
		var xFactor = xFactors[factorIndex];
		array_delete(xFactors, factorIndex, 1);
		
		var yFactor = yFactors[factorIndex];
		array_delete(yFactors, factorIndex, 1);
		
		var randomOffsetMetersBound = self.islandRadiusMeters / 16;
		var randomOffsetMeters = irandom_range(-randomOffsetMetersBound, randomOffsetMetersBound);

		var xOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * xFactors[i]) + randomOffsetMeters);
		var yOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * yFactors[i]) + randomOffsetMeters);
		

		// Get Island Name
		var islandName = "Island" + "R" + string(self.regionNumber) + "I" + string(i);
		// show_debug_message("islandName: " + islandName);
		var islandType = asset_get_index(islandName);
		// show_debug_message(object_get_name(islandType));
		
		// Make Island
		var newIsland = CreateIsland(xOffsetPixels, yOffsetPixels, islandType);
		array_push(self.islands, newIsland);
	}
}

self.radius = MetersToPixels(self.islandRadiusMeters * 4);
self.CreateLightHouseIsland();
self.CreateIslands();
