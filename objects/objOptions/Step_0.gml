
fullscreenOption = window_get_fullscreen();
smoothingOption = gpu_get_texfilter();

#region register input

input.enter = (keyboard_check_pressed(vk_enter) or
	keyboard_check_pressed(vk_space) or
	keyboard_check_pressed(global.acceptKeybind) or
	gamepad_button_check_pressed(global.controller, gp_face1) or
	gamepad_button_check_pressed(global.controller, gp_start) or
	keyboard_check_pressed(vk_left) or
	keyboard_check_pressed(vk_right));

input.up = (keyboard_check_pressed(vk_up) or keyboard_check_pressed(global.upKeybind));

input.down = (keyboard_check_pressed(vk_down) or keyboard_check_pressed(global.downKeybind));

input.left = (keyboard_check_pressed(vk_left) or keyboard_check_pressed(global.leftKeybind));

input.right = (keyboard_check_pressed(vk_right) or keyboard_check_pressed(global.rightKeybind));

input.back = (keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(global.backKeybind));

#endregion

if (input.up) {if (curSelected > 0) curSelected--; audio_play_sound(sndScrollMenu, 0, false);}
if (input.down) {if (curSelected < optionAmount[category]) curSelected++; audio_play_sound(sndScrollMenu, 0, false);}

if (input.enter) {
	options_select(category, curSelected);
}

if (curSelected = 0) {
	if (input.left) {if (category > 0) category--; audio_play_sound(sndScrollMenu, 0, false);}
	if (input.right) {if (category < 2) category++; audio_play_sound(sndScrollMenu, 0, false);}
}

// offset add
if (category = 0) && (curSelected = 2) {
	var addBy = 1;
	if (keyboard_check(vk_shift)) addBy = 5;
	
	if (input.right) global.offset += addBy;
	
	if (input.left) global.offset -= addBy;
}

if (input.back)
{
	if (instance_exists(objFade)) exit;

	save_options();

	audio_play_sound(sndCancelMenu, 10, false);
	o = instance_create_depth(0, 0, -10000, objFade);
	o.roomTo = rmMainMenu;	
}

global.offset = clamp(global.offset, -120, 120);