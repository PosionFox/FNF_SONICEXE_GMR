
// set where the cam should go
if (instance_exists(objCamPointEnemy))
{
	xTo = objCamPointEnemy.x;
	yTo = objCamPointEnemy.y;
}
else if (instance_exists(objCamPointPlayer))
{
	xTo = objCamPointPlayer.x;
	yTo = objCamPointPlayer.y;
}
else
{
	xTo = 1369;
	yTo = 772;
}





