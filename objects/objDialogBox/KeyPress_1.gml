if (finished) exit;
if (instance_exists(objCutscene)) exit;
audio_play_sound(sndClickText, 0, false);

if (curDialog + 1 >= array_length(dialog))
{
	alarm[0] = 20;
	finished = true;
}
else {
	curDialog += 1;
	curLetter = 0;	
}

