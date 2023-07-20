
#region register input

input.enter = (keyboard_check_pressed(vk_enter) or
	keyboard_check_pressed(vk_space) or
	keyboard_check_pressed(global.acceptKeybind) or
	gamepad_button_check_pressed(global.controller, gp_face1) or
	gamepad_button_check_pressed(global.controller, gp_start));

input.up = (keyboard_check_pressed(vk_up) or
	keyboard_check_pressed(global.upKeybind) or
	gamepad_button_check_pressed(global.controller, gp_padu));

input.down = (keyboard_check_pressed(vk_down) or
	keyboard_check_pressed(global.downKeybind) or
	gamepad_button_check_pressed(global.controller, gp_padd));

input.left = (keyboard_check_pressed(vk_left) or
	keyboard_check_pressed(global.leftKeybind) or
	gamepad_button_check_pressed(global.controller, gp_padl));

input.right = (keyboard_check_pressed(vk_right) or
	keyboard_check_pressed(global.rightKeybind) or
	gamepad_button_check_pressed(global.controller, gp_padr));

input.back = (keyboard_check_pressed(vk_backspace) or
	keyboard_check_pressed(global.backKeybind) or
	gamepad_button_check_pressed(global.controller, gp_face2));

#endregion

if (input.down)
{
	curSelected -= 1;
	if (curSelected = -1) curSelected = array_length(songsList) - 1;
	audio_play_sound(sndScrollMenu, 10, false);	
	
	iconYOffset = 10;
	
	//changeSong();
}

if (input.up)
{
	curSelected += 1;
	if (curSelected = array_length(songsList)) curSelected = 0;
	audio_play_sound(sndScrollMenu, 10, false);
	
	iconYOffset = -10;
	
	//changeSong();
}

if (input.back)
{
	if (instance_exists(objFade)) exit;

	audio_play_sound(sndCancelMenu, 10, false);
	var o = instance_create_depth(0, 0, -10000, objFade);
	o.roomTo = rmMainMenu;
}

if (input.left) and (difSelected > 0) { difSelected--; }
	
if (input.right) and (difSelected < 2) { difSelected++; }

if (input.enter)
{
	//if (difSelected != 2) && !(keyboard_check(vk_shift)) or (instance_exists(oFade)) exit;
	
	audio_play_sound(sndConfirmMenu, 10, false);
	
	var songString = songsList[curSelected];
	//songString =  string_upper_first(songString);
	
	global.songOn = 0;
	global.currentDif = difSelected;
	global.freeplay = true;
	global.nextSong[0] = "";
	//load_chart(songString, global.currentDif);
	switch (songString)
	{
		case "monochrome":
			global.currentDif = 1;
		break;
		case "insomnia":
			global.currentDif = 2;
		break;
	}
	show_debug_message("freeplay song string: " + string(songString));
	loadSongChart(songString);
	
	var o = instance_create_depth(x, 0, -10000, objFade);
	o.roomTo = stage_get_room(global.stage);
}

var songString = songsList[curSelected];
var songNam = string_upper_first(songString); // get the songs name

// song has changed
if (lastSelected != curSelected)
{
	//// get the selected songs directory
	//var directory = songNam + "/" + songNam + "_Hard.ini";
	//if (global.useProgramDir) directory = working_directory +"\\Songs\\" + directory;
	
	//// load the selected songs data
	//ini_open(directory);
	//curEnemy = ini_read_real("Song", "Enemy", global.enemy);
	//songString = ini_read_string("Song", "Song File", "Tutorial_Inst");
	//ini_close();
	
	global.songData = loadSongData("data/" + string(songsList[curSelected]) + "/" + string(songsList[curSelected]) + ".json", false);
	
	// play the songs music
	audio_stop_sound(musicPlaying);
	musicPlaying = audio_play_sound(asset_get_index(global.songData.instFile), 10, true);
}

if (keyboard_check_pressed(ord("V"))) {
	//global.specialSongs = !global.specialSongs;
	//global.bSides = false;
	//room_restart();
}

lastSelected = curSelected;

// small animation variables
if (iconYOffset < 0) iconYOffset++;
if (iconYOffset > 0) iconYOffset--;