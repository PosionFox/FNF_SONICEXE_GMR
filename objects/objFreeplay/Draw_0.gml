
if !(global.customFreeplay)
{
	special_backgrounds(curEnemy);
}
else
{
	var songFrame;
	switch songsList[curSelected]
	{
		case "stress": songFrame = 1; break;
		default: songFrame = 0; break;
	}
	draw_sprite(sprBackgroundCustom, songFrame, 0, 0);
}

