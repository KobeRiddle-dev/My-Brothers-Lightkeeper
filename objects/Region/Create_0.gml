/// @description Insert description here
// You can write your code in this editor

self.islands = [];

for (var i = 0; i < self.numberSideIslands; i++)
{
	var newIsland = instance_create_layer(self.x, self.y, "Islands", Island);
	
	array_push(self.islands, newIsland);
	
}