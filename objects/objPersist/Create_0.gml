// chart info
texturegroup_load("Default");
surface_depth_disable(true);

global.roomBefore = room;

global.hudSurface = surface_create(1280, 720)
hudBopVsp = 0;
hudBopScale = 0;
hudBopTimer = 0;

hudAlpha = 0;
hudAlphaTarget = 1;
hudAlphaSpd = 0.01;

oldCamX = 1164;
oldCamY = 692;

// fonts
draw_set_font(fntDefault);
global.font = font_add_sprite_ext(sprMessageFont, "abcdefghijklmnopqrstuvwxyz,_0123456789-.:@~", true, -2);
var comboNumStr = "0123456789-x";
global.comboNumberFont = font_add_sprite_ext(sprComboNumber, comboNumStr, true, -20);
global.comboNumberFontPixel = font_add_sprite_ext(sprComboNumberPixel, comboNumStr, true, -20);



// gui
volumeDisplay = 0;
timeUntilMoveOn = 0;
timeUntilMoveOnMax = 3;


load_data();

// basic controller support because I don't think I have the patience to go through the whole project and rewrite it
// i dont blame you - codist
//i did it dw - codist 2021-05-08

// delta time
targetDelta = 1 / 120;
actualDelta = DT;
global.deltaMultiplier = actualDelta / targetDelta;


calculateDelta = function()
{
	targetDelta = 1 / 120;
	actualDelta = DT;
	global.deltaMultiplier = actualDelta / targetDelta;
}

calculateDelta();

