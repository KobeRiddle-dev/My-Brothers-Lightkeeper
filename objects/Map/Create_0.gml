/// @description Insert description here
// You can write your code in this editor

/// @instancevar {Real} numberFragments; 
/// @instancevar {Id.Instance.Region} region; 

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
	var randomIsland = self.region.GetRandomIsland();

	var fragmentX = randomIsland.GetRandomXWithin();
	var fragmentY = randomIsland.GetRandomYWithin();
	
	show_debug_message("creating fragment at x:" + string(fragmentX) + ", y: " + string(fragmentY));

	instance_create_layer(fragmentX, fragmentY, "Objects", MapPiece, {parentMap: self.id});
}

DisperseFragments();