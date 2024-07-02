/// @description Insert description here
// You can write your code in this editor

// TODO: currently, this is very finnicky and requires pressing and releasing interact very quickly.

if (IsInteractInputDown())
{
	self.boatMode = !self.boatMode;
	self.boat = other;
}