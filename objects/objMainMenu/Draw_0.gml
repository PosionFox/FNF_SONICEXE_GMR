//background
draw_sprite_ext(sprBackgroundFunk, round(bgFlash), 640, 360 + yBgOff, 1.05, 1.05, 0, c_white, 1);

var spr = sprStoryMode;
if (menuSelected = 0) spr = sprStoryModeSelect;
draw_sprite_ext(spr, image_index, x, y, 1, 1, 0, c_white, round(textFlash[0]));

var spr = sprFreeplay;
if (menuSelected = 1) spr = sprFreeplaySelect;
draw_sprite_ext(spr, image_index, x, y + 160, 1, 1, 0, c_white, round(textFlash[1]));

var spr = sprOptions;
if (menuSelected = 2) spr = sprOptionsSelect;
draw_sprite_ext(spr, image_index, x, y + (160 * 2), 1, 1, 0, c_white, round(textFlash[2]));

var spr = sprDonate;
if (menuSelected = 3) spr = sprDonateSelect;
draw_sprite_ext(spr, image_index, x, y + (160 * 3), 1, 1, 0, c_white, round(textFlash[3]));
