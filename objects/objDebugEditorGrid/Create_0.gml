gridSize = 40;

selBoxX = 0;
selBoxY = 0;
notePosX = 0;
notePosY = 0;

section = 0;
dontDraw = false;

fnfBotMode = false;
fnfBotEnemy = false;


inputKeyUp = function()
{
	if (mouse_wheel_up())
	|| (keyboard_check(vk_up))
		return true;
	else
		return false;
}

inputKeyDown = function()
{
	if (mouse_wheel_down())
	|| (keyboard_check(vk_down))
		return true;
	else
		return false;
}
