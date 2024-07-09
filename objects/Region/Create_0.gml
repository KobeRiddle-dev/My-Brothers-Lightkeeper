/// @description Insert description here
// You can write your code in this editor

self.islands = [];

CreateIsland = function(xOffset, yOffset, islandType)
{
	return instance_create_layer(self.x + xOffset, self.y + yOffset, self.islandLayer, islandType)
	
}

CreateIslands = function()
{
	for (var i = 1; i <= self.numberSideIslands; i++)
	{
		var xOffset = 10 * i;
		var yOffset = 10 * i;
		
		var islandName = "Island" + "R" + string(self.regionNumber) + "I" + string(i);
		show_debug_message("islandName: " + islandName);
		var islandType = asset_get_index(islandName);
		show_debug_message(object_get_name(islandType));
		
		var newIsland = CreateIsland(xOffset, yOffset, islandType);

		array_push(self.islands, newIsland);	
	}
}

CreateIslands();