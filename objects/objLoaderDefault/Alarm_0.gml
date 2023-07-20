
instance_activate_object(objBoyfriend);
instance_activate_object(objEnemy);
var sprites = {};
if (instance_exists(objBoyfriend) and global.songData[$ "player1"] != undefined)
{
	sprites = character_get_sprites(global.songData.player1);
	array_push(spritesToLoad, sprites.idle);
	array_push(spritesToLoad, sprites.left);
	array_push(spritesToLoad, sprites.down);
	array_push(spritesToLoad, sprites.up);
	array_push(spritesToLoad, sprites.right);
}
if (instance_exists(objEnemy))
{
	sprites = objEnemy.sprites;
	array_push(spritesToLoad, sprites.idle);
	array_push(spritesToLoad, sprites.left);
	array_push(spritesToLoad, sprites.down);
	array_push(spritesToLoad, sprites.up);
	array_push(spritesToLoad, sprites.right);
}
instance_deactivate_object(objBoyfriend);
instance_deactivate_object(objEnemy);

if (array_equals(spritesToLoad, global.previousLoadedSprites))
{
	ready = true;
	exit;
}

global.previousLoadedSprites = spritesToLoad;
is_loading = true;
