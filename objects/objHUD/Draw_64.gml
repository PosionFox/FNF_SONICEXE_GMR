
if !(global.dead)
{
if (!surface_exists(hudSurf)) hudSurf = surface_create(1280, 720);
surface_set_target(hudSurf);
draw_clear_alpha(c_white, 0);
// bpm code

if !(global.flashlight)
{
	global.hp = clamp(global.hp, 0, 100)

	// draw healthbar
	var hpWidth = (global.hp / hpMax) * healthXOff;
	draw_rectangle_color(x + outlineWidth, y - outlineWidth, x - healthXOff - outlineWidth, y + healthYOff + outlineWidth, hpBackColor, hpBackColor, hpBackColor, hpBackColor, false);
	draw_rectangle_color(x, y, x - healthXOff, y + healthYOff, hpEmptyColor, hpEmptyColor, hpEmptyColor, hpEmptyColor, false);
	draw_rectangle_color(x, y, x - hpWidth, y + 10, hpColor, hpColor, hpColor, hpColor, false);
	draw_rectangle_color(x, y, x - (displayHpMin / hpMax) * healthXOff, y + 10, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);

	var boyHpLow = (global.hp <= 10) or (global.fragile);
	var enemyHpLow = (global.hp >= 90);

	enem = global.enemy;
	bf = 0;
	enemyIconSpr = sprIcons;
	bfIconSpr = sprIcons;

	special_icons(global.enemy);

	var enemyIcon = (enem + 1) * 2;
	var bfIcon = bf * 2;

	if (global.combo >= 100) bfIconSpr = sprIconsBFEpic;
	
	//draw_sprite_ext(enemyIconSpr,enemyIcon + enemyHpLow, x - hpWidth , y, 1 + iconBop, 1 + iconBop, 0, c_white, 1); // enemy icon
	//draw_sprite_ext(character_get_icon(global.songData[$ "player2"]),enemyIcon + enemyHpLow, x - hpWidth , y, 1 + iconBop, 1 + iconBop, 0, c_white, 1); // enemy icon
	if (instance_exists(objEnemy))
	{
		draw_sprite_ext(objEnemy.icon, enemyIcon + enemyHpLow, x - hpWidth , y, 1 + iconBop, 1 + iconBop, 0, c_white, 1); // enemy icon
	}
	draw_sprite_ext(bfIconSpr,bfIcon + boyHpLow,x - hpWidth, y, -1 + -iconBop, 1 + iconBop, 0, c_white, 1); // boy icon
}

// score
draw_set_font(global.comboNumberFont);
if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10) draw_set_font(global.comboNumberFontPixel);
draw_set_halign(fa_right);
hiddenScore = lerp(hiddenScore, global.curScore, 0.2);
draw_text_transformed(1270, 5, round(hiddenScore), 0.3, 0.3, 0);
draw_text_transformed(1270, 35, "x" + string(global.combo), 0.3, 0.3, 0);
draw_set_halign(fa_left);
draw_set_font(fntDefault);

if (global.advancedHud) or (global.auto) {
	// timer
	var curTime;
	if (global.audioSyncGroup)
	{
		curTime = audio_sync_group_get_track_pos(global.musicSync);
	}
	else
	{
		curTime = audio_sound_get_track_position(global.songId);
	}
	var leng = audio_sound_length(global.song) - 0.1;

	draw_pie(1242, 675, curTime, leng, c_white, 30, 0.8);
	
	draw_set_halign(fa_center);
	draw_set_font(fntDefaultOutline);
	
	var accuracy = round(100 - ((missCount / (hitCount + missCount)) * 100));
	var str = "HP: " + string(round(global.hp)) + "%" + "          " + "MISSES: " + string(missCount) + "          " + "ACCURACY: " + string(accuracy) + "%";
	if (global.auto) str = "! AUTO MODE !";
	draw_text_transformed(640, 670, str, 1, 1, 0);	
	draw_text_transformed(640, 690, string(lastFrameWindow) + "ms", 1, 1, 0);
	
	draw_set_font(fntDefault);
	draw_set_halign(fa_left);
}
surface_reset_target();
if (!surface_exists(hudSurf)) hudSurf = surface_create(1280, 720);
draw_surface_ext(hudSurf, 0 - (hudBop * 640), 0 - (hudBop * 360), 1 + hudBop, 1 + hudBop, 0, c_white, hudAlpha);
}