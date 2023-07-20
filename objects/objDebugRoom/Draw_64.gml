draw_text(1003, 100 + (24 * 0), "Song Name: " + global.songName);

draw_text(1003, 100 + (24 * 1), "Song File: " + audio_get_name(global.song));

var voiceFile = "";
if (global.voices != "") voiceFile = audio_get_name(global.voices);
draw_text(1003, 100 + (24 * 2), "Vocals File: " + voiceFile);


draw_text(1003, 100 + (24 * 3), "Notespeed: " + string(global.noteSpeed));
draw_text(1003, 100 + (24 * 4), "BPM: " + string(global.bpm));
draw_text(1003, 100 + (24 * 5), "Enemy: " + string(global.enemy));

var difName = "Easy";
if (dif = 1) difName = "Normal";
if (dif = 2) difName = "Hard";
draw_text(1003, 100 + (24 * 6), "Difficulty: " + string(difName));
draw_text(1003, 100 + (24 * 7), "Cam Speed: " + string(global.camSpeed));

draw_text(1003, 100 + (24 * 8), "Stage: " + string(global.songData[$ "stage"]));

draw_text_ext(1003, 100 + (24 * 10), @"Controls:
V = Save
L = Load
Shift + L = Load legacy
N = Notespeed
B = BPM
O = Song
P = Vocals
E = Enemy
X = Difficulty
C = Cam Speed
R = Reset
S = Stage select", 20, 10000000);

draw_text(512, 100, string(selectedEvent));
