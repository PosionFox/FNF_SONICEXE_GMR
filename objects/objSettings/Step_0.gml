
if (instance_exists(objMapKey)) { exit; }

#region register input

input.enter = (keyboard_check_pressed(vk_enter) or
	keyboard_check_pressed(vk_space) or
	keyboard_check_pressed(global.acceptKeybind) or
	gamepad_button_check_pressed(global.controller, gp_face1) or
	gamepad_button_check_pressed(global.controller, gp_start));// or
	//keyboard_check_pressed(vk_left) or
	//keyboard_check_pressed(vk_right));

input.up = (keyboard_check_pressed(vk_up) or keyboard_check_pressed(global.upKeybind));

input.down = (keyboard_check_pressed(vk_down) or keyboard_check_pressed(global.downKeybind));

input.left = (keyboard_check_pressed(vk_left) or keyboard_check_pressed(global.leftKeybind));

input.right = (keyboard_check_pressed(vk_right) or keyboard_check_pressed(global.rightKeybind));

input.back = (keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(global.backKeybind));

#endregion

if (input.down)
{
	if (menuIndex == array_length(currentMenu.options) - 1)
	{
		menuIndex = 0;
	}
	else
	{
		menuIndex++;
	}
	audio_play_sound(sndScrollMenu, 0, false);
}
if (input.up)
{
	if (menuIndex == 0)
	{
		menuIndex = array_length(currentMenu.options) - 1;
	}
	else
	{
		menuIndex--;
	}
	audio_play_sound(sndScrollMenu, 0, false);
}

menuIndex = clamp(menuIndex, 0, array_length(currentMenu.options) - 1);

if (input.left)
{
	currentMenu.options[menuIndex].pressLeft();
	audio_play_sound(sndScrollMenu, 0, false);
}

if (input.right)
{
	currentMenu.options[menuIndex].pressRight();
	audio_play_sound(sndScrollMenu, 0, false);
}

if (input.enter)
{
	currentMenu.options[menuIndex].pressEnter();
	audio_play_sound(sndConfirmMenu, 0, false);
}

if (input.back)
{
	if (currentMenu == categories)
	{
		if (instance_exists(objFade)) exit;
		
		save_options();
		
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = rmMainMenu;
	}
	else
	{	
		menuIndex = 0;
		currentMenu = categories;
	}
	audio_play_sound(sndCancelMenu, 10, false);
}

offsetY = lerp(offsetY, menuIndex, 0.1);
