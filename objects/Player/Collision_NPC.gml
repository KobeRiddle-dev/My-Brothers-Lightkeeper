/// @description Insert description here
// You can write your code in this editor

if (IsInteractInputDown())
{
	/// @type {Id.Instance.NPC}
	var npc = other;

	show_debug_message("Player Position: x:" + string(self.x) + " y:" + string(self.y))
	npc.CreateDialog();

	global.dialogMode = true;
}