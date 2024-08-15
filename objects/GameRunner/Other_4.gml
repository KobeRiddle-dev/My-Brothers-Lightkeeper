/// @description Insert description here
// You can write your code in this editor
audio_play_sound(MainTheme, 1, true);

// application_surface_draw_enable(false);

window_set_fullscreen(true);

view_set_wport(0, display_get_width());
view_set_hport(0, display_get_height());

randomize();

surface_resize(application_surface, display_get_width(), display_get_height());