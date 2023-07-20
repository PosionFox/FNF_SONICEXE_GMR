
if (ready)
{
	instance_activate_all();
	if (instance_exists(objEnemy))
	{
		//objEnemy.readyUp();
		objEnemy.onLoad();
	}
	
	instance_destroy();
}

if (is_loading)
{
	sprite_index = spritesToLoad[currentSprite];
	image_speed = 1;
}
