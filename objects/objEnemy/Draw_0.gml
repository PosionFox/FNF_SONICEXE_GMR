if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) or (global.enemy = 103) gpu_set_texfilter(false); // pixel filtering

if (global.dead) exit;

var drawSprite = sprite_index;
var drawIndex = image_index;
if (animationTimer > 0) && (sprite_index == sprites.idle)
{
	var usedLeft = sprites.left;
	var usedDown = sprites.down;
	var usedUp = sprites.up;
	var usedRight = sprites.right;
	if (altUsed)
	{
		usedLeft = spritesAlt.left;
		usedDown = spritesAlt.down;
		usedUp = spritesAlt.up;
		usedRight = spritesAlt.right;
	}
	
	if (dir = Notes.left)	spriteUsed = usedLeft;
	if (dir = Notes.down) spriteUsed = usedDown;
	if (dir = Notes.up) spriteUsed = usedUp;
	if (dir = Notes.right) spriteUsed = usedRight;
	
	drawSprite = spriteUsed;
	drawIndex = animationIndex;
}

if (global.enemy = 10)
{
	shadowSprite[2] = shadowSprite[1];
	shadowSprite[1] = shadowSprite[0];
	shadowSprite[0] = drawSprite;

	draw_sprite_ext(shadowSprite[2], drawIndex - 3, x, y, image_xscale, image_yscale, 0, c_white, 0.1);
	draw_sprite_ext(shadowSprite[1], drawIndex - 2, x, y, image_xscale, image_yscale, 0, c_white, 0.3);
	draw_sprite_ext(shadowSprite[0], drawIndex - 1, x, y, image_xscale, image_yscale, 0, c_white, 0.5);
}

draw_sprite_ext(drawSprite, drawIndex, x, y, image_xscale, image_yscale, 0, c_white, 1);

gpu_set_texfilter(beforeAA);
