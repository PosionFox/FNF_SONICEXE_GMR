
if (switchTurn)
{
	global.turn = -global.turn;	
}
if (bfHey)
{
	if (global.dead) exit;
	
	if (x < 600)
	{
		var newSpriteEnemy = undefined;
		if (global.songName = "Ugh") newSpriteEnemy = sprTankmanUgh;
		if (global.songName = "Stress") newSpriteEnemy = sprTankmanHey;
		if (newSpriteEnemy != undefined)
		{
			objEnemy.animationTimer = 0;
			objEnemy.sprite_index = newSpriteEnemy;
			objEnemy.image_index = 0;	
		}
	}
	else
	{
		objBoyfriend.sprite_index = objBoyfriend.sprCheer;
		objBoyfriend.image_index = 0;
	}
}
if (useAlt)
{
	with (objEnemy) altUsed = !altUsed;
}

if (goldDmg)
{
	global.hpMinimum += 25;
}