/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} numberFragments; 
/// @instancevar {Id.Instance.Region} region 

self.fragments = [];

/// @param {Id.Instance.MapPiece} fragment 
AddFragment = function(fragment)
{
	if (!instance_exists(fragment))
		return;

	//TODO: check if fragment is actually a fragment?		
	array_push(self.fragments, fragment);
}

IsComplete = function()
{
	return array_length(self.fragments) == self.numberFragments;
}

DisperseFragments = function()
{
	for (var i = 0; i < self.numberFragments; i++)
		DisperseFragment();
	
}

DisperseFragment = function()
{
	var randomIndex = irandom_range(0, array_length(self.region.islands) - 1);
	var randomIsland = self.region.islands[randomIndex];
	
	show_debug_message("creating fragment at x:" + string(randomIsland.x) + ", y: " + string(randomIsland.y));
	instance_create_layer(randomIsland.x, randomIsland.y, "Objects", MapPiece, {parentMap: self.id});
}

DisperseFragments();