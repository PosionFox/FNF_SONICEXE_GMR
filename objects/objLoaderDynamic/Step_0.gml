
if (ready and !doneLoading)
{
	instance_activate_all();
	if (instance_exists(objEnemy))
	{
		//objEnemy.readyUp();
		objEnemy.onLoad();
	}
	doneLoading = true;
}
else
{
	if (texturegroup_get_status(texG) == texturegroup_status_fetched)
	{
		ready = true;
	}
}


