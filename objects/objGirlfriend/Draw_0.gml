if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) gpu_set_texfilter(false); // pixel filtering
if (animationTimer > 0) {
	if (dir = Notes.left)	spriteUsed = sprGirlfriendLeft;
	if (dir = Notes.down) spriteUsed = sprGirlfriendDown;
	if (dir = Notes.up) spriteUsed = sprGirlfriendUp;
	if (dir = Notes.right) spriteUsed = sprGirlfriendRight;
	draw_sprite_ext(spriteUsed, animationIndex, x, y, image_xscale, image_yscale, 0, c_white, 1);
} else {
	draw_self();
}
gpu_set_texfilter(beforeAA);