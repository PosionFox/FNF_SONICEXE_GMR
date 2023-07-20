/// @description Load song

if (keyboard_check(vk_shift)) // legacy charts
{
	var songName = get_string("(Loading) Song Name:", "");
	dif = get_integer("Difficulty (0 - easy, 1 - normal, 2 - hard):", "");

	if (songName != "") { global.songName = songName; } else { exit; }

	load_chart(global.songName, dif);
	global.currentDif = dif;
}
else
{
	var songName = get_string("(Loading) Song Name:", "");
	dif = get_integer("Difficulty (0 - easy, 1 - normal, 2 - hard):", "");

	if (songName != "") { global.songName = songName; } else { exit; }

	//load_chart(global.songName, dif, true);
	global.currentDif = dif;
	loadSongChart(string(global.songName));
}
