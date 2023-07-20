// list everything in the menu
menus[0] = "exit to menu";
menus[1] = "restart song";
menus[2] = "resume";

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
pauseSprite = sprite_create_from_surface(application_surface, 0, 0, 1280, 720, false, false, 0, 0)
curSelected = 2; // decides which menu in the list is selected
timer = 20; // timer prevents from events being activated instantly

// pick the fake location of the boyfriend
bfSprite = objBoyfriend.sprite_index;
bfFakeX = objBoyfriend.x;
bfFakeY = objBoyfriend.y;
bfFakeIndex = objBoyfriend.image_index;
bfFakeScale = objBoyfriend.image_xscale;

// pick the fake location of the girlfriend
gfSprite = objGirlfriend.sprite_index;
gfFakeX = objGirlfriend.x;
gfFakeY = objGirlfriend.y;
gfFakeIndex = objGirlfriend.image_index;
gfFakeScale = objGirlfriend.image_xscale;

// pick the fake location of the enemy
enSprite = undefined;
if (instance_exists(objEnemy))
{
	objEnemy.onPause();
	enSprite = objEnemy.sprite_index;
	enFakeX = objEnemy.x;
	enFakeY = objEnemy.y;
	enFakeIndex = objEnemy.image_index;
	enFakeScaleX = objEnemy.image_xscale;
	enFakeScaleY = objEnemy.image_yscale;
}
if (instance_exists(objBoyfriend))
{
	
}

// create lists for the offsets of each item in the menu list
yOffset = array_create(array_length(menus))
xOffset = array_create(array_length(menus))

curAlpha = 0;
curAlphaTo = 0.5;

// deactivate all objects, and pause the music
if (global.audioSyncGroup)
{
	audio_pause_sync_group(global.musicSync);
}
else
{
	audio_pause_sound(global.songId);
	audio_pause_sound(global.voicesId);
}
instance_deactivate_all(true);