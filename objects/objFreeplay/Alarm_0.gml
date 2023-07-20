
ini_open("playerdata.save");
var difString = "Easy";
if (difSelected = 1) difString = "Normal";
if (difSelected = 2) difString = "Hard";
visibleScore = ini_read_real(songsList[curSelected], difString, 0);
ini_close();
alarm[0] = 20;
