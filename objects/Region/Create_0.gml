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
	return instance_create_layer(creationX, creationy, "Boat", LightHouse, {region: self.id, storm: storm});
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

GetRandomIsland = function()
{
	var randomIndex = irandom_range(0, array_length(self.islands) - 1);
	return self.islands[randomIndex];
}

/// @description 
/// @param {String} npcMood 
CreateNpc = function(npcMood)
{
	var randomIsland = GetRandomIsland();
	var npcX = randomIsland.GetRandomXWithin();
	var npcY = randomIsland.GetRandomYWithin();

	instance_create_layer(npcX, npcY, "NPCs", NPC, {mood: npcMood});
}

CreateNextRegion = function()
{
	var nextRegionX = self.x + MetersToPixels(irandom_range(self.radiusMeters, self.radiusMeters * 2));
	var nextRegionY = self.y + MetersToPixels(irandom_range(self.radiusMeters, self.radiusMeters * 2));
	
	var nextRegionNumber = self.regionNumber + 1;
	var nextNumberSideIslands = self.numberSideIslands + 1;

	show_debug_message("creating region at x: " + string(nextRegionX) + ", y: " + string(nextRegionY) + ", type: " + object_get_name(Region));
	var nextRegionId = instance_create_layer(nextRegionX, nextRegionY, "Regions", Region, {regionNumber: nextRegionNumber, numberSideIslands: nextNumberSideIslands});

	self.lightHouse.nextRegionId = nextRegionId;
	
	draw_triangle_color(self.x, self.y, nextRegionX - MetersToPixels(16), nextRegionY - MetersToPixels(16), nextRegionX + MetersToPixels(16), nextRegionY + MetersToPixels(16), c_yellow, c_yellow, c_yellow, false);

	draw_line_width_color(self.x, self.y, nextRegionX, nextRegionY, MetersToPixels(1), c_yellow, c_yellow);
}

self.npcMoods = ["serious, cheery, angry"];

self.radiusMeters = self.islandRadiusMeters * 8;
self.fog = self.CreateFog();
self.CreateLightHouseIsland();
self.lightHouse = CreateLightHouse(self.CreateStorm());
self.CreateIslands();
self.map = self.CreateMap();

if (self.regionNumber == 1)
{
	self.CreateNpc("serious");
}

if (self.regionNumber == 2)
{
	self.CreateNpc("cheery", 0);
	self.CreateNpc("angry", 0);
}

if (self.regionNumber == 3)
{
	self.CreateNpc("cheery", 1);
	self.CreateNpc("angry", 1);
}

if (self.regionNumber == 4)
{
	self.CreateNpc("cheery", 2);
	self.CreateNpc("angry", 2);
}
