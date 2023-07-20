
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

animate += 0.08;
if !(selected) bfAnimate = animate;
else if (bfAnimate < 2) bfAnimate += 0.08;

yOffset = lerp(yOffset, yOffsetTo, 0.1);
yOffsetTo = selectedWeek * 120;

// week change
if !(selected)
{
	if (input.enter)
	{
		if (selected) exit;
		//if (global.currentDif != 2) && !(keyboard_check(vk_shift)) exit; // TEMP BECAUSE I HAVE YET TO FINISH THE OTHER DIFS
	
		global.freeplay = false;
		global.songOn = 0;
		selected = true;
		audio_play_sound(sndConfirmMenu, 100, false);
		bfAnimate = 0;
		global.weekPlaying = selectedWeek;
	}

	if (input.back)
	{
		if (instance_exists(objFade)) exit;

		audio_play_sound(sndCancelMenu, 10, false);
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = rmMainMenu;
	}

	if (input.up)
	{
		audio_play_sound(sndScrollMenu, 10, false);
		if (selectedWeek > 0) selectedWeek--;
		else selectedWeek = global.weeks;
	}
	if (input.down)
	{
		audio_play_sound(sndScrollMenu, 10, false);
		if (selectedWeek < global.weeks) selectedWeek++;
		else selectedWeek = 0;
	}

	// dif change
	var maxDif = 2;
	if (input.left)
	{
		difOffset = -20;
		if (global.currentDif > 0) global.currentDif--;
		else global.currentDif = maxDif;
	}
	if (input.right)
	{
		difOffset = -20;
		if (global.currentDif < maxDif) global.currentDif++;
		else global.currentDif = 0;
	}

	if ((keyboard_check(vk_left)) 
	|| (keyboard_check_pressed(global.leftKeybind))
	|| (gamepad_button_check(global.controller, gp_padl))) leftArrowScaleTo = 0.8; 
		else leftArrowScaleTo = 1;
	
	if ((keyboard_check(vk_right)) 
	|| (keyboard_check_pressed(global.rightKeybind))
	|| (gamepad_button_check(global.controller, gp_padl))) rightArrowScaleTo = 0.8; 
		else rightArrowScaleTo = 1;
}
if (selected) selectedTimer++;
if (selectedTimer = 120)
{
	global.specialSongs = false;
	
	// weeks
	for (var i = 0, n = array_length(weeks[selectedWeek].songs); i < n; i++)
	{
		show_debug_message("loading song " + string(i));
		global.nextSong[i] = weeks[selectedWeek].songs[i];
	}
	array_push(global.nextSong, "");
	loadSongChart(global.nextSong[0]);
	global.songOn = 1;
	
	var o = instance_create_depth(x, 720, -1000, objFade);
	o.roomTo = stage_get_room(global.stage);
	
	//if (selectedWeek = 0)
	//{
	//	//load_chart("Tutorial", global.currentDif);
	//	loadSongChart("tutorial");
	//	global.nextSong[0] = "n";
	//}
	//if (selectedWeek = 1)
	//{
	//	//load_chart("Bopeebo", global.currentDif);
	//	loadSongChart("bopeebo");
	//	global.nextSong[0] = "fresh";
	//	global.nextSong[1] = "dad-battle";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 2)
	//{
	//	//load_chart("Spookeez", global.currentDif);
	//	loadSongChart("spookeez");
	//	global.nextSong[0] = "south";
	//	global.nextSong[1] = "monster";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 3)
	//{
	//	//load_chart("Pico", global.currentDif);
	//	loadSongChart("pico");
	//	global.nextSong[0] = "philly-nice";
	//	global.nextSong[1] = "blammed";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 4)
	//{
	//	//load_chart("Satin_panties", global.currentDif);
	//	loadSongChart("satin-panties");
	//	global.nextSong[0] = "high";
	//	global.nextSong[1] = "milf";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 5)
	//{
	//	//load_chart("Cocoa", global.currentDif);
	//	loadSongChart("cocoa");
	//	global.nextSong[0] = "eggnog";
	//	global.nextSong[1] = "winter-horrorland";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 6)
	//{
	//	//load_chart("Senpai", global.currentDif);
	//	loadSongChart("senpai");
	//	global.nextSong[0] = "roses";
	//	global.nextSong[1] = "thorns";
	//	global.nextSong[2] = "n";
	//}
	//if (selectedWeek = 7)
	//{
	//	load_chart("Ugh", global.currentDif);
	//	//loadSongChart("ugh");
	//	global.nextSong[0] = "guns";
	//	global.nextSong[1] = "stress";
	//	global.nextSong[2] = "n";
	//}
}

leftArrowScale = lerp(leftArrowScale, leftArrowScaleTo, 0.3);
rightArrowScale = lerp(rightArrowScale, rightArrowScaleTo, 0.3);

if (difOffset < 0) { difOffset += 2; }