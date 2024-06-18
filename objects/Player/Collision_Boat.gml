/// @description Insert description here
// You can write your code in this editor

// TODO: currently, this is very finnicky and requires holding down interact to keep the boat.

if (self.boatMode)
{
	if (IsInteractInputDown())
	{
		self.boatMode = false;
		self.boat = other;
	}
}
else
{
	if (IsInteractInputDown())
	{
		self.boatMode = true;
	}
}