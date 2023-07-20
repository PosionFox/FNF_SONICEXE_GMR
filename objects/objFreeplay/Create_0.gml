
songsList = ["goddess"];

songsIconList = [];

for (var i = 0, n = array_length(songsList); i < n; i++)
{
	var data = loadSongData("data/" + string(songsList[i]) + "/" + string(songsList[i]) + ".json", false);
	songsIconList[i] = character_get_icon(data.player2);
}

input = {
	enter : false,
	up : false,
	down : false,
	left : false,
	right : false,
	back : false
}

curEnemy = 0;

difSelected = 1;
curSelected = array_length(songsList) - 1;
lastSelected = -1;
timer = 20;

audio_stop_all();
musicFree = asset_get_index("Tutorial_Inst");
musicPlaying = audio_play_sound(real(musicFree), 10, true);

scorDisplay = 0;
visibleScore = 0;

addToPath = "";

yOffset = array_create(array_length(songsList));
xOffset = array_create(array_length(songsList));

iconYOffset = 0;

alarm[0] = 20;
