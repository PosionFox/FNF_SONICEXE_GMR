
if !(selected)
{
	// the max amount of menu options
	var menuMax = 3;
	if (keyboard_check_pressed(vk_down))
	|| (keyboard_check_pressed(global.downKeybind))
	|| (gamepad_button_check_pressed(global.controller, gp_padd))
	{
		audio_play_sound(sndScrollMenu, 0, false);
		if (menuSelected < menuMax) menuSelected++;
		else menuSelected = 0;
	}
	if (keyboard_check_pressed(vk_up))
	|| (keyboard_check_pressed(global.upKeybind))
	|| (gamepad_button_check_pressed(global.controller, gp_padu))
	{
		audio_play_sound(sndScrollMenu, 0, false);
		if (menuSelected > 0) menuSelected--;
		else menuSelected = menuMax;
	}
	if ((keyboard_check_pressed(vk_enter)) 
	|| (keyboard_check_pressed(vk_space))
	|| (keyboard_check_pressed(global.acceptKeybind))
	|| (gamepad_button_check_pressed(global.controller, gp_face1))
	|| (gamepad_button_check_pressed(global.controller, gp_start)))
	{
		if (instance_exists(objFade)) exit;
		audio_play_sound(sndConfirmMenu, 1, false);
		if (menuSelected = 0)
		{
			selected = true;
			textFlash[1] = 0;
			textFlash[2] = 0;
			textFlash[3] = 0;
		}
		if (menuSelected = 1)
		{
			selected = true;
			textFlash[0] = 0;
			textFlash[2] = 0;
			textFlash[3] = 0;
		}
		if (menuSelected = 2)
		{
			selected = true;
			textFlash[0] = 0;
			textFlash[1] = 0;
			textFlash[3] = 0;
		}
		if (menuSelected = 3) url_open("https://ninja-muffin24.itch.io/funkin");
	}
	
}

if (selected)
{
	selectedTimer++;	
	if (textFlash[menuSelected] >= 1) textFlash[menuSelected] = 0; textFlash[menuSelected] += 0.05;
	if (bgFlash >= 1) bgFlash = 0; bgFlash += 0.02;
}
if (selectedTimer = 120)
{
	if (menuSelected = 0)
	{
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = rmMainMenu;
		//if (global.chaCurrent != "")
		//{
		//	global.songOn = 0;
		//	global.freeplay = true;
		//	global.nextSong[0] = "";
		//	switch (global.chaCurrent)
		//	{
		//		case global.chaMonochrome:
		//			loadSongChart("monochrome");
		//		break;
		//		case global.chaInsomnia:
		//			global.currentDif = 2;
		//			loadSongChart("insomnia");
		//		break;
		//	}
		//	o.roomTo = stage_get_room(global.stage);
		//}
	}
	if (menuSelected = 1)
	{
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = rmFreePlay;
		if (global.chaCurrent != "")
		{
			global.songOn = 0;
			global.freeplay = true;
			global.nextSong[0] = "";
			switch (global.chaCurrent)
			{
				case global.chaMonochrome:
					loadSongChart("monochrome");
				break;
				case global.chaInsomnia:
					global.currentDif = 2;
					loadSongChart("insomnia");
				break;
			}
			o.roomTo = stage_get_room(global.stage);
		}
	}
	if (menuSelected = 2)
	{
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = rmOptions;
	}
}

yBgOff = lerp(yBgOff, yBgTo, 0.06);
if (menuSelected = 0) yBgTo = -10;
if (menuSelected = 1) yBgTo = 0;
if (menuSelected = 2) yBgTo = 10;
if (menuSelected = 3) yBgTo = 20;