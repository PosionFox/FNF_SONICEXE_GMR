
instance_deactivate_object(self);
// choose the sprites to use
char = "sprBoyfriend";
flipped = false;
scale = image_yscale; // the entire scale
isPixel = false;
ready = true;
//boyfriend_sprites();

sprites = character_get_sprites(global.songData[$ "player1"] ?? "bf")
if (sprites.idle == sprBoyfriendPixelIdle) scale = 6;

useMiss = true;
//if !(sprite_exists(asset_get_index(sprite_get_name(sprites.left) + "Miss"))) useMiss = false;

singSprite = -1;

// basic variables
missed = false; // when you have missed

holdAnimation = false; // if the animation should be repeated because their is a hold arrow
animCount = 0; // how long the animation should last for

sprChanged = false; // make sure that the idle sprite has been changed
restartTimer = -1; // how long it has been since you pressed restart (dead variable)

notePlaying = 0; // what direction the animation should be played as

singFrameMulti = 1; // the multiplier for the animation image speed
if (global.enemy = 5) singFrameMulti = 2;
singFrame = 0; // the frame the animation is on

bpmTimer = 0;
bopFrame = 0;

recAlpha = 0; // death rectangle alpha
returnTo = -1; // return to the main menu if this is 1

global.curScore = 0;
global.combo = 0;

//sprIdle = sprBoyfriendIdle;
// death
//sprDeath2 = asset_get_index(sprite_get_name(sprDeath) + "2");
//sprDeath3 = asset_get_index(sprite_get_name(sprDeath) + "3");
deathSound = sndFnfLossSfx;
gameoverMusic = sndGameOver;
gameoverMusicEnd = sndGameOverEnd;
if (isPixel) {
	deathSound = sndFnfLossSfxPixel;
	gameoverMusic = sndGameOverPixel;
	gameoverMusicEnd = sndGameOverEndPixel;
}

// auto stuff
dir = Notes.left;
animationTimer = 0;
animationIndex = 0;
deathAnimCooldown = 0;

spriteUsed = sprites.left;

//prefetchPlayerSprites();

beforeAA = gpu_get_texfilter();


// check for arrow keys
// activate the animation when keys are pressed
function noteCheck(key, altKey, controllerKey, dir)
{
	if (keyboard_check_pressed(key)) || (keyboard_check_pressed(altKey))
	|| (gamepad_button_check_pressed(global.controller, controllerKey))
	{
		if (missed)
		{
			animCount = 70;
		}
		else
		{
			notePlaying = dir;
			animCount = 45;
			singFrame = 0;
		}
	}
}
	