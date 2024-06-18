/// @description Insert description here
// You can write your code in this editor

show_debug_message("activated: " + string(self.activated));
if (self.activated)
{
	draw_enable_drawevent(true);
	
	//draw_set_colour(c_yellow);
	//draw_set_alpha(1);
	
	//draw_circle(self.x, self.y, 3000, false);
	
	
	 draw_set_color(c_white);
	 draw_set_font(-1);
	 draw_set_alpha(1);
	 draw_text_transformed(room_width/2, room_height/2, "Hello! I'm activated!", 5, 5, 0);

}