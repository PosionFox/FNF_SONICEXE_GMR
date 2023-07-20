
beatUpdate();

if (notesFinished)
{
	if (useCountdown)
	{
		countdownUpdate();
	}
}

var countdownMulti = ((countdown / (bpm / 60)) * 2);
songPositionMulti = audio_sound_get_track_position(musicStream) - countdownMulti;

crochet = (60 / bpm);
stepCrochet = crochet / 4;

stepUpdate();
