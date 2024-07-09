/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} regionNumber
/// @instancevar {Real} numberSideIslands
/// @instancevar {Id.Layer} islandLayer
/// @instancevar {Id.Layer} weatherLayer
/// @instancevar {Real} islandRadiusMeters 
/// @instancevar {Id.Instance.Map} map
/// @instancevar {Id.Instance.LightHouse} lightHouse
/// @instancevar {Id.Instance.LightHouseIsland} lightHouseIsland
/// @instancevar {Asset.GMObject.Island} lightHouseIslandType
/// @instancevar {Any} foo 

/// @type{Array<Id.Instance.Island>}
self.islands = [];

/// @type{Real}
self.radiusMeters = 0;

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
	show_debug_message("creating lightHouse Island at x: " + string(self.x) + ", y: " + string(self.y) + ", type: " + object_get_name(self.lightHouseIslandType));
	return instance_create_layer(self.x, self.y, self.islandLayer, self.lightHouseIslandType);
}

/// @param {Id.Instance.Storm} storm 
CreateLightHouse = function(storm)
{
	var creationX = self.x;
	var creationy = self.y;

	show_debug_message("creating lightHouse at x: " + string(creationX) + ", y: " + string(creationy) + ", type: " + object_get_name(LightHouse));
	return instance_create_layer(creationX, creationy, "Objects", LightHouse, {region: self.id, storm: storm});
}

CreateStorm = function()
{
	return instance_create_layer(self.x, self.y, self.weatherLayer, Storm, {region: self.id, radiusMeters: self.islandRadiusMeters * 2});
}

CreateFog = function()
{
	return instance_create_layer(self.x, self.y, self.weatherLayer, Fog, {region: self.id});
}

CreateMap = function()
{
	return instance_create_layer(self.x, self.y, "Objects", Map, {region: self.id, numberFragments: self.regionNumber})
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
		
		var randomOffsetMetersBound = self.islandRadiusMeters / 2;
		var randomOffsetXMeters = irandom_range(-randomOffsetMetersBound, randomOffsetMetersBound);
		var randomOffsetYMeters = irandom_range(-randomOffsetMetersBound, randomOffsetMetersBound);

		var xOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * xFactors[i]) + randomOffsetXMeters);
		var yOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * yFactors[i]) + randomOffsetYMeters);

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

self.radiusMeters = self.islandRadiusMeters * 8;
self.fog = self.CreateFog();
self.CreateLightHouseIsland();
self.lightHouse = CreateLightHouse(self.CreateStorm());
self.CreateIslands();
self.map = self.CreateMap();
