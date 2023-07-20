dir = Notes.left;
spriteUsed = sprGirlfriendLeft;
animationTimer = 0;
animationIndex = 0;
scale = image_yscale;

if (room = rmTitle) {
	sprite_index = sprGirlfriendTitle;	
	image_speed = (100 / 60) / 2;
}

bpmMulti = 2;
if (global.enemy = 5) sprite_index = sprGirlfriendCarIdle;
if (global.enemy = 6) or (global.enemy = 7) sprite_index = sprGirlfriendChristIdle;
if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) {sprite_index = sprGirlfriendPixelIdle; scale = 6;}
if (global.enemy = 11) sprite_index = sprGirlfriendTankIdle;

if (global.enemy = 102) sprite_index = sprGirlfriendCodist;

beforeAA = gpu_get_texfilter();