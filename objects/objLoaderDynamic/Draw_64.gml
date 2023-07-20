
if (!ready)
{
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();

	draw_sprite_stretched(sprLoading, 0, 0, 0, _w, _h);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_w / 2, _h - 32, "Loading dynamic textures...");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}


