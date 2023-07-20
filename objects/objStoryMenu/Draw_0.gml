// weeks
for (var i = 0; i < global.weeks + 1; ++i) {
	var opacity = 1; if (i != selectedWeek) opacity = 0.5;
	draw_sprite_ext(sprWeeks, i, 380, 524 + (i * 120) - yOffset, 1.002488, 1.002488, 0 ,c_white, opacity);
}

// bg
draw_rectangle_color(0, 0, 1280, 120, c_black, c_black, c_black, c_black, false);
draw_sprite(sprBackgroundStory, 0, 0, 0);

draw_text_transformed(5, 0, "WEEK SCORE: " + string(round(scorDisplay)), 1.7, 1.7, 0);
draw_set_halign(fa_right);
draw_set_color(c_ltgray);
draw_text_transformed(1275, 0, weeks[selectedWeek].name, 1.7, 1.7, 0);
draw_set_halign(fa_left);
draw_set_color(c_white);

// character outlines
var enemyOutline = sprDaddyOutline;
if (selectedWeek = 2) enemyOutline = sprSpookyOutline;
if (selectedWeek = 3) enemyOutline = sprPicoOutline;
if (selectedWeek = 4) enemyOutline = sprMomOutline;
if (selectedWeek = 5) enemyOutline = sprParentsOutline;
if (selectedWeek = 6) enemyOutline = sprSenpaiOutline;
if (selectedWeek = 7) enemyOutline = sprTankmanOutline;
if (selectedWeek != 0) draw_sprite_ext(enemyOutline, animate, 264, 450, 0.4980007, 0.4980007, 0, c_white, 1);
draw_sprite_ext(sprGirlfriendOutline, animate * 2, 753, 16, 0.4980007, 0.4980007, 0, c_white, 1);

var bfSprite = sprBoyfriendOutline;
if (selected) bfSprite = sprBoyfriendPeaceOutline;
draw_sprite_ext(bfSprite, bfAnimate, 596, 468, 0.8962366, 0.8962366, 0, c_white, 1);

// dif
draw_sprite_ext(sprDifArrow, 0, 700, 524, leftArrowScale, leftArrowScale, 0, c_white, 1); // left
draw_sprite(sprDifs, global.currentDif, 906, 524 + difOffset); // left
draw_sprite_ext(sprDifArrow, 1, 1110, 524, rightArrowScale, rightArrowScale, 0, c_white, 1); // right

//if (global.currentDif != 2) {
//	 // TEMP BECAUSE I HAVE YET TO FINISH THE OTHER DIFS
//	draw_sprite(sDifsLock, 0, 906, 524  + difOffset);
	
//	draw_set_halign(fa_right);
//	draw_set_valign(fa_bottom);
//	draw_text(1260, 700, "NORMAL and EASY difficultys are temporarily disabled\ndue to having no time to finish them.\n\nIf you would like to help, contact me. :D")
//	draw_set_valign(fa_top);
//	draw_set_halign(fa_left);
//}

// text
var curWeekScore = global.weekScoreEasy[selectedWeek];
if (global.currentDif  = 1) curWeekScore = global.weekScoreNormal[selectedWeek];
if (global.currentDif  = 2) curWeekScore = global.weekScoreHard[selectedWeek];
scorDisplay = lerp(scorDisplay, curWeekScore, 0.2);