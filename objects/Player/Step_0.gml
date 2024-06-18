/// @description Updates the player object each frame.
// You can write your code in this editor


function Update()
{
    var horizontalInput = GetHorizontalInput();
    var verticalInput = GetVerticalInput();
    var interactDown = IsInteractInputDown();

    if (self.boatMode)
    {
        with(self.boat)
		{
            Boat.Move(horizontalInput, verticalInput);
            // TODO: make this less ugly and awful -- other refers to the player here and self refers to the boat :|
            other.x = self.x;
            other.y = self.y;
		}
		
    }
    else
    {
        Move(horizontalInput, verticalInput);
    }
}



Update();