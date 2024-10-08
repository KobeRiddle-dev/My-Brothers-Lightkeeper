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

	var xFactors = [-1, 0, 1, -1, 1, -1, 0, 1];
	var yFactors = [-1, -1, -1, 0, 0, 1, 1, 1]

	if (self.regionNumber == 4)
	{
		self.numberSideIslands = 1;
	}
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

		var xOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * xFactor) + randomOffsetXMeters);
		var yOffsetPixels = MetersToPixels((self.islandRadiusMeters * 2 * yFactor) + randomOffsetYMeters);

		// Get Island Name
		var islandNumber = irandom_range(1, 4);
		var islandName = "Island" + string(islandNumber) + "Obj";
		// show_debug_message("islandName: " + islandName);
		var islandType = asset_get_index(islandName);
		// show_debug_message(object_get_name(islandType));
		
		if (self.regionNumber == 4)
		{
			islandType = IslandFinalObj;
		}

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
/// @param {Real} phraseSet 
CreateNpc = function(npcMood, phraseSet)
{
	var randomIsland = GetRandomIsland();
	var npcX = randomIsland.GetRandomXWithin();
	var npcY = randomIsland.GetRandomYWithin();

	if (npcMood == "serious")
	{
		instance_create_layer(npcX, npcY, "NPCs", SeriousNPCObj, {mood: npcMood, phraseSet: phraseSet});
	}
	else if (npcMood == "cheery")
	{
		instance_create_layer(npcX, npcY, "NPCs", CheeryNPCObj, {mood: npcMood, phraseSet: phraseSet});
	}
	else if (npcMood == "angry")
	{
		instance_create_layer(npcX, npcY, "NPCs", AngryNPCObj, {mood: npcMood, phraseSet: phraseSet});
	}

}

CreateNextRegion = function()
{
	var nextRegionX = self.x + MetersToPixels(irandom_range(self.radiusMeters, self.radiusMeters * 1.5));
	var nextRegionY = self.y - MetersToPixels(irandom_range(self.radiusMeters, self.radiusMeters * 1.5));
	
	var nextRegionNumber = self.regionNumber + 1;
	var nextNumberSideIslands = self.numberSideIslands + 1;

	show_debug_message("creating region at x: " + string(nextRegionX) + ", y: " + string(nextRegionY) + ", type: " + object_get_name(Region));
	var nextRegionId = instance_create_layer(nextRegionX, nextRegionY, "Regions", Region, {regionNumber: nextRegionNumber, numberSideIslands: nextNumberSideIslands});

	self.lightHouse.nextRegionId = nextRegionId;
}

self.npcMoods = ["serious, cheery, angry"];

var islandNumber = irandom_range(1, 4);
var islandName = "Island" + string(islandNumber) + "Obj";
var islandType = asset_get_index(islandName);
self.lightHouseIslandType = islandType;


self.radiusMeters = self.islandRadiusMeters * 8;
self.fog = self.CreateFog();

self.CreateIslands();
if (self.regionNumber != 4)
{
	self.CreateLightHouseIsland();
	self.lightHouse = CreateLightHouse(self.CreateStorm());
	self.map = self.CreateMap();
}


if (self.regionNumber == 1)
{
	self.CreateNpc("serious", 0);
}
else if (self.regionNumber == 2)
{
	self.CreateNpc("serious", 1);
	self.CreateNpc("cheery", 0);
	self.CreateNpc("angry", 0);
}
else if (self.regionNumber == 3)
{
	self.CreateNpc("cheery", 1);
	self.CreateNpc("angry", 1);
}
else if (self.regionNumber == 4)
{
	self.CreateNpc("serious", 2);
	self.CreateNpc("cheery", 2);
	self.CreateNpc("angry", 2);
}
