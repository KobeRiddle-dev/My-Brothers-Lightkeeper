/// @description Insert description here
// You can write your code in this editor
self.fragments = [];

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