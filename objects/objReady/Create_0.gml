
instance_deactivate_object(self);
//image_speed = (global.bpm / 60) / 30 * global.deltaMultiplier;
start = true;
image_speed = 0;
muted = false;

// changeable 3 2 1
snd3 = sndIntro3;
snd2 = sndIntro2;
snd1 = sndIntro1;
sndGo = sndIntroGo;
if (global.enemy = 8) or (global.enemy = 9) or (global.enemy = 10)
{
	sprite_index = sprReadySetGoPixel;
	snd3 = sndIntro3Pixel;
	snd2 = sndIntro2Pixel;
	snd1 = sndIntro1Pixel;
	sndGo = sndIntroGoPixel;
}



// dialog
hasDialog = false;

var dialogueFile = global.songName + "\\dialogue.txt";
if (global.useProgramDir) dialogueFile = working_directory + "\\Songs\\" + dialogueFile;
if (file_exists(dialogueFile)) hasDialog = true;
if (global.freeplay) hasDialog = false;

audio_stop_all();

if (global.songData[$ "player2"] == "gold")
{
	visible = false;
}
global.songIsPlaying = false;
if !(hasDialog)
{
	if !(global.songData[$ "player2"] == "gold")
	{
		//audio_play_sound(snd3, 10, false);
	}
}
else
{
	instance_create_depth(x, y, -100000, objDialogBox);
	image_speed = 0;
	start = false;
}

// death reset
if (global.dead = true)
{
	var o = instance_create_depth(0, 0, depth - 100, objFade);
	with (o)
	{
		fadeY = -199;
		moved = true;
	}
	global.dead = false;
}
global.playVoice = 1;
global.turn = 1;

// start music
global.musicSync = audio_create_sync_group(false);
audio_play_in_sync_group(global.musicSync, global.song);
if (global.voices != "") audio_play_in_sync_group(global.musicSync, global.voices);