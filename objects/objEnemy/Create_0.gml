
ready = true;

texGroup = "";
image_speed = 1;
dir = Notes.left;
animationTimer = 0;
animationIndex = 0;
holdAnimation = false;
singFrameMulti = 1;
bpmTimer = 0;
threeFrame = false;
if (global.middle_scroll)
{
	hideArrows = true;
}

killIfLowAccuracy = false;

sprEnemy[0] = "sprGirlfriend";
sprEnemy[1] = "sprDad";
sprEnemy[2] = "sprSpooky";
sprEnemy[3] = "sprMonster";
sprEnemy[4] = "sprPico";
sprEnemy[5] = "sprMom";
sprEnemy[6] = "sprCParentsDad";
sprEnemy[7] = "sprMonsterChrist";
sprEnemy[8] = "sprSenpai";
sprEnemy[9] = "sprSenpaiMad";
sprEnemy[10] = "sprSpirit";
sprEnemy[11] = "sprTankman";
sprEnemy[100] = "sprWhitty";
sprEnemy[101] = "sprWhittyC";
sprEnemy[102] = "sprOxi";
sprEnemy[103] = "sprBoyfriendPixel";

if (global.enemy = 0) instance_destroy();

var sprChosen = sprEnemy[global.enemy];
//sprIdle = asset_get_index(sprChosen + "Idle");
//sprLeft = asset_get_index(sprChosen + "Left");
//sprDown = asset_get_index(sprChosen + "Down");
//sprUp = asset_get_index(sprChosen + "Up");
//sprRight = asset_get_index(sprChosen + "Right");

//sprites = character_get_sprites(global.songData[$ "player2"] ?? "dad");

if (self[$ "sprites"] == undefined)
{
	sprites = {};
	sprites.idle = sprBoyfriendIdle;
	sprites.up = sprBoyfriendUp;
	sprites.left = sprBoyfriendLeft;
	sprites.down = sprBoyfriendDown;
	sprites.right = sprBoyfriendRight;
}

spritesAlt = {
	idle : sprBoyfriendIdle,
	up : sprBoyfriendUp,
	left : sprBoyfriendLeft,
	down : sprBoyfriendDown,
	right : sprBoyfriendRight
}

sprite_index = sprites.idle;

//if (global.enemy = 6)
//{
//	sprLeftAlt =	sprCParentsMomLeft;
//	sprDownAlt =	sprCParentsMomDown;
//	sprUpAlt =	sprCParentsMomUp;
//	sprRightAlt =	sprCParentsMomRight;
//}

scale = image_yscale;
if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) or (global.enemy = 103) scale = 6;

flipped = false;
if (global.enemy = 4) or (global.enemy = 103) flipped = true;
if (flipped)
{
	var oldLeft = sprites.left; var oldRight = sprites.right;
	sprites.left = oldRight; sprites.right = oldLeft;
}

altUsed = false;

spriteUsed = sprites.left;
shadowSprite[0] = sprite_index;
shadowSprite[1] = sprite_index;
shadowSprite[2] = sprite_index;

beforeAA = gpu_get_texfilter();


onLoad = function() {}

start = function() {}

onPause = function() {}

onUnpause = function() {}

