// smoothly move the cam to the x pos
x = lerp(xTo, x, 0.97);
y = lerp(yTo, y, 0.97);

xTapOffset = lerp(xTapOffset, 0, 0.02 * DTM);
yTapOffset = lerp(yTapOffset, 0, 0.02 * DTM);

// if the player is dead, move the camera to him
if (global.dead)
{
	xTo = objBoyfriend.x;
	yTo = objBoyfriend.y - 200;
}
else
{
	if (instance_exists(objCamPointInterest))
	{
		xTo = objCamPointInterest.x;
		yTo = objCamPointInterest.y;
	}
	else
	{
		if (zoomingTimer >= 120)
		{
			zoomBop = 0.01;
			zoomingTimer = 0;
		}
		zoomingTimer += ((global.bpm / 60) / 4) * DTM;
		zoomBop = lerp(zoomBop, 0, 0.1 * (((global.bpm / 60) / 4) * DTM));
		// decide what the position should be for the camera
	
		var finalXOffset = offsetX + xTapOffset;
		var finalYOffset = offsetY + yTapOffset;
		if !(global.turn)
		{
			// enemy turn
			if (global.enemy != 0)
			{
				//xTo = 1049 + offsetX;
				//yTo = 593 + offsetY;
				if (instance_exists(objCamPointEnemy))
				{
					xTo = objCamPointEnemy.x + finalXOffset;
					yTo = objCamPointEnemy.y + finalYOffset;
				}
			}
			else
			{
				// girlfriend
				xTo = 1251;
				yTo = 600;
			}
		}
		else
		{
			// bf turn
			//xTo = 1369 + bfOffsetX;
			//yTo = 752 + bfOffsetY - (((sprite_get_height(objBoyfriend.sprites.idle)/2) % 8) * 8);	
			// idk I just wanted to automatically adjust for the height of all characters but I get if you wanna remove that
			if (instance_exists(objCamPointPlayer))
			{
				xTo = objCamPointPlayer.x + finalXOffset;
				yTo = objCamPointPlayer.y + finalYOffset;
			}
		}
	}
}

if (keyboard_check_pressed(vk_enter))
|| (keyboard_check_pressed(global.acceptKeybind))
|| (gamepad_button_check_pressed(global.controller, gp_start))
{
	if (instance_exists(objPause)) exit;
	if (instance_exists(objDialogBox)) exit;
	if (global.dead) exit;
	if (rankingScreen) exit;
	
	instance_create_layer(0, 0, "Main", objPause);
}

// backgrounds
//if (!instance_exists(oPause))
//{
//	background_setup();
//}

if (rankingScreen)
{
	// zoom the camera
	//global.camWidth = 1024;
	//global.camHeight = 576;
	global.camZoom = 1.25;
	
	xTo = objBoyfriend.x - 200;
	yTo = objBoyfriend.y - 200;
}

zoom = lerp(zoom, global.camZoom, 0.1);

// change the cameras size
var cam = view_camera[0];
camera_set_view_size(cam, global.camWidth / (zoom * (1 + zoomBop)), global.camHeight / (zoom * (1 + zoomBop)));
