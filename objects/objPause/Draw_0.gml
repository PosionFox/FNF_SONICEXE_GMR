// draw the fake characters
draw_sprite_ext(gfSprite, gfFakeIndex, gfFakeX, gfFakeY, gfFakeScale, gfFakeScale, 0, c_white, 1);
draw_sprite_ext(bfSprite, bfFakeIndex, bfFakeX, bfFakeY, bfFakeScale, bfFakeScale, 0, c_white, 1);
if (enSprite != undefined) {
	draw_sprite_ext(enSprite, enFakeIndex, enFakeX, enFakeY, enFakeScaleX, enFakeScaleY, 0, c_white, 1);
}
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(pauseSprite, 0, cx, cy, 1 / global.camZoom, 1 / global.camZoom, 0, c_white, 1);
