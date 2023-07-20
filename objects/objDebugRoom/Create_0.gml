audio_stop_all();

var songToPlay = global.voices;
//var songToPlay = global.song;
if (global.voices = "") { songToPlay = global.song; }
global.music = audio_play_sound(songToPlay, 10, true);

dif = global.currentDif;

selectedEvent = undefined;
