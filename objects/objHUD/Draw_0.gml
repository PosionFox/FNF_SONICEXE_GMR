
if (!instance_exists(objPersist)) exit;

if (objPersist.timeUntilMoveOn < objPersist.timeUntilMoveOnMax)
{
	// hud surface
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);

	// draw the hud
	if !(surface_exists(global.hudSurface)) global.hudSurface = surface_create(1280, 720);
	if (!surface_exists(hudSurf)) hudSurf = surface_create(1280, 720);
	if (!surface_exists(surf_arrows)) surf_arrows = surface_create(1280, 720);
	//draw_surface_stretched(global.hudSurface, camX - 640 - (hudBopScale / 2), camY - 360 - (hudBopScale / 2), global.camWidth + hudBopScale,  global.camHeight + hudBopScale);
	surface_set_target(surf_arrows);
	draw_clear_alpha(c_white,0);
	if (instance_exists(objArrowBtnParent))
	{
		with (objArrowBtnParent)
		{
			if (instance_exists(objDialogBox)) break;
			if !(global.dead) draw_self();
			//draw_line(x, y - 192, x, y + 192);
		}
	}
	if (instance_exists(objNote))
	{
		with (objNote)
		{
			if (y > 1280) continue;
			if !(global.dead)
			{
				draw_set_alpha(0.8 + (image_alpha - 1));
				draw_sprite_stretched(midNote, image_index, x - 18, y, 50 * image_xscale, sliderLength);	
				if (sliderLength = 0) draw_set_alpha(0);
				draw_sprite_stretched(lowNote, image_index, x - 18, y + (sliderLength) - 4, 50 * image_xscale, 65 * image_xscale);
				draw_set_alpha(1);
	
				if !(heldAlready) && !(notRealNote) draw_self();
			}
			//draw_text(x, y, y);
		}
	}
	if (instance_exists(objSickParticle))
	{
		with (objSickParticle)
		{
			if !(global.dead) draw_self();
		}
	}
	surface_reset_target();
	surface_set_target(global.hudSurface);
	draw_clear_alpha(c_white,0);
	
	
	surface_reset_target();
	
	var camHeightDown = ((global.camHeight / global.camZoom) * global.downScroll) * (1 + hudBop);
	var camHeightNegative = global.camHeight / global.camZoom;
	if (global.downScroll) camHeightNegative = -global.camHeight;
	var _xx = arrowsX + camX - (hudBop * 640);
	var _yy = arrowsY + (camY + camHeightDown) - (hudBop * 360)
	var _xscale = ((global.camWidth / global.camZoom) / 1280) * (1 + hudBop);
	var _yscale = ((camHeightNegative / global.camZoom) / 720) * (1 + hudBop);
	
	draw_surface_ext(global.hudSurface, _xx, _yy, _xscale, _yscale, 0, c_white, hudAlpha);
	if (!global.middle_scroll)
	{
		draw_surface_ext(surf_arrows, _xx, _yy, _xscale, _yscale, 0, c_white, hudAlpha);
	}
	else
	{
		draw_surface_ext(surf_arrows, _xx - 256, _yy, _xscale, _yscale, 0, c_white, hudAlpha);
	}
}
