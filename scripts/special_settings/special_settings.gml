function special_icons(enemy){
	if (enemy = 8) or (enemy = 9) {enem = enemy; bf = 0; enemyIconSpr = sprIcons; bfIconSpr = sprIconsSpecial} // senpai
	if (enemy = 10) {enem = 10; bf = 0; enemyIconSpr = sprIcons; bfIconSpr = sprIconsSpecial} // senpai

	if (enemy = 100) {enem = 0; bf = 0; enemyIconSpr = sprIconsSpecial; bfIconSpr = sprIcons} // whitty
	if (enemy = 101) {enem = 1; bf = 0; enemyIconSpr = sprIconsSpecial; bfIconSpr = sprIcons} // whitty
	if (enemy = 102) {enem = 3; bf = 3; enemyIconSpr = sprIconsSpecial; bfIconSpr = sprIconsSpecial;} // codist and oxi
	if (enemy = 103) {enem = -1; bf = 0; enemyIconSpr = sprIconsSpecial; bfIconSpr = sprIcons;} // pixel bf
}

function special_backgrounds(enemy){
	if (global.specialSongs) or (global.bSides) {
		var ind = 0;
		if (enemy = 100) or (enemy = 101) {ind = 1;} // whitty
		if (enemy = 102) {ind = 0;} // codist and oxi
		if (global.bSides) ind = 2;
	
		if (global.specialSongs) draw_sprite(sprBackgroundFunkOther, ind, 0, 0);	
	}
}