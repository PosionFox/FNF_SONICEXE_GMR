
#region register input

input.enter = (keyboard_check_pressed(vk_enter) or
	keyboard_check_pressed(vk_space) or
	keyboard_check_pressed(vk_left) or
	keyboard_check_pressed(vk_right) or
	gamepad_button_check_pressed(global.controller, gp_face1) or
	gamepad_button_check_pressed(global.controller, gp_start));

input.down = (keyboard_check_pressed(vk_down) or
	gamepad_button_check_pressed(global.controller, gp_padd));

input.up = (keyboard_check_pressed(vk_up) or
	gamepad_button_check_pressed(global.controller, gp_padu));

input.back = (keyboard_check_pressed(vk_backspace) or
	gamepad_button_check_pressed(global.controller, gp_face2));

#endregion

if (input.down)
{
	curSelected -= 1;
	if (curSelected = -1) { curSelected = array_length(options) - 1; }
	audio_play_sound(sndScrollMenu, 10, false);	
}
if (input.up)
{
	curSelected += 1;
	if (curSelected = array_length(options)) { curSelected = 0; }
	audio_play_sound(sndScrollMenu, 10, false);
}

if (input.back) {
	if (instance_exists(objFade)) { exit; }

	audio_stop_all();
	audio_play_sound(sndCancelMenu, 10, false);
	audio_play_sound(sndFreakyMenu, 10, false);
	room_goto(rmMainMenu);
}

if (input.enter)
{
	audio_play_sound(sndConfirmMenu, 10, false);
	switch (curSelected)
	{
		case 8:
			// open song
			var file = get_open_filename_ext("FNF Song Data|*.json", "", "", "Select a FNF Song File");
			if (file = "") { exit; }
			songData = loadSongData(file);
			
			audio_stop_all();
			audio_play_sound(asset_get_index(songData.instFile), 10, true);
		break;
		case 7:
			songData.name = get_string("Song Name:", "");
			songData.instFile = songData.name + "_Inst";
			songData.voiceFile = songData.name + "_Voices";
			
			audio_stop_all();
			audio_play_sound(asset_get_index(songData.instFile), 10, true);
		break;
		case 6:
			songData.enemy = get_integer("Enemy ID:", "");
		break;
		case 5:
			songData.difficulty++;
			if (songData.difficulty > 2) songData.difficulty = 0;
		break;
		case 4:
			songData.noteSpeed = get_integer("Notespeed:", "");
		break;
		case 3:
			songData.bpm = get_integer("BPM:", "");
		break;
		case 0:
			//var selectedDir = get_save_filename_ext("GMS2 Song Data|*.ini", songData.name + "_" + difName[songData.difficulty], working_directory, "Select a place to save the GMS2 Song File")
			
			//ini_open(selectedDir)
			//ini_write_string("Song", "Notes", json_NoteOutput)
			//ini_write_string("Song", "Enemy", json_Enemy)
			//ini_write_string("Song", "Camspeed", json_CamSpeed)
			//ini_write_string("Song", "BPM", json_BPM)
			//ini_write_string("Song", "Notespeed", json_NoteSpeed)
			//ini_write_string("Song", "Vocal File", json_VoiceFile)
			//ini_write_string("Song", "Song File", json_SongFile)
			//ini_write_string("Song", "Name", json_SongName)
			//ini_close()
		break;
	}
}