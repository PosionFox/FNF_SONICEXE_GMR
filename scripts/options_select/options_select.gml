
function options_select(category, option)
{
	switch (category)
	{
		case 0: // options
			switch (option)
			{
				case 1: // fullscreen
					window_set_fullscreen(!fullscreenOption);
				break;
				case 3: // hud
					global.advancedHud = !global.advancedHud;
				break;
				case 4: // discord
					discord = !discord;
					
					ini_open("options.ini");
					ini_write_real("Options", "Discord", discord);
					ini_close();
					
					game_restart();
				break;
				case 5: // downscroll
					global.downScroll = !global.downScroll;
				break;
				case 6:
					global.ghostTapping = !global.ghostTapping;
				break;
				case 7: // audio sync group
					global.audioSyncGroup = !global.audioSyncGroup;
				break;
			}
		break;
		case 1: // graphics
			switch (option)
			{
				case 1: // smoothing
					gpu_set_texfilter(!smoothingOption)
					break;
				case 2: // particles
					global.particles = !global.particles;
					break;
				case 3: // particles
					global.customFreeplay = !global.customFreeplay;
					break;
			}
		break;
		case 2: // keybinds
			if (option = 0) exit;
		
			var changeKey = "left"; var globalToChange = "leftKeybind";
			if (option = 2) {changeKey = "down"; globalToChange = "downKeybind";}
			if (option = 3) {changeKey = "up"; globalToChange = "upKeybind";}
			if (option = 4) {changeKey = "right"; globalToChange = "rightKeybind";}
		
			if (option = 5) {changeKey = "accept"; globalToChange = "acceptKeybind";}
			if (option = 6) {changeKey = "back"; globalToChange = "backKeybind";}
		
			var o = instance_create_depth(x, y, -1000, objMapKey);
			o.keyString = changeKey;
			o.globalString = globalToChange;
		break;
	}
	audio_play_sound(sndConfirmMenu, 0, false);
}

