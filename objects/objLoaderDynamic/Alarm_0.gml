/// @description load dynamics

instance_activate_object(objEnemy);
if (instance_exists(objEnemy))
{
	texG = objEnemy.texGroup;
}
instance_deactivate_object(objEnemy);

if (texG != "")
{
	texturegroup_load(texG);
}
else
{
	ready = true;
}






