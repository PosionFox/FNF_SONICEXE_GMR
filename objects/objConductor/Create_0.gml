instance_destroy();
#macro SCROLL_DISTANCE 1.6 // units
#macro SCROLL_TIME 2 // sec

countdownSounds = [
	sndIntro3,
	sndIntro2,
	sndIntro1,
	sndIntroGo
]


songData = undefined;

songName = "";
songDifficulty = "";

bpm = 100.0;
scrollSpeed = 1;
songSpeed = 1;

musicStream = undefined;
vocalStream = undefined;

countingDown = false;
countdown = 0;
countdownState = 0;
lastCount = 0;

useCountdown = false;

beatCounter = 1;
halfBeatCounter = 1;

loaded = false;
muteVocals = false;

songPositionMulti = 0;

noteThread = 0;
notesFinished = false;

chartType = undefined;

crochet = 0;
stepCrochet = 0;

lastStep = 0;
curStep = 0;

lastBeat = 0;
curBeat = 0;

startingPosition = 0;


songLoadJson = function(file)
{
	show_debug_message("trying to load song:");
	show_debug_message(file);
	var data;
	if (file_exists(file))
	{
		var buff = buffer_load(file);
		var str = buffer_read(buff, buffer_string);
		buffer_delete(buff);
		data = json_parse(str);
		return data;
		show_debug_message("song data loaded successfully");
	}
	else
	{
		show_debug_message("file does not exists");
		return -1;
	}
}


beatUpdate = function()
{
	if (beatCounter <= 0)
	{
		beatCounter = beatCounter + 1;
		halfBeatCounter += 1;
		if (halfBeatCounter >= 2)
		{
			halfBeatCounter = 0;
		}
	}
}


countdownUpdate = function()
{
	
}


stepUpdate = function()
{
	curStep = floor(songPositionMulti / stepCrochet);
	if (curStep != lastStep)
	{
		
	}
	
	curBeat = floor(curStep / 4);
	if (curBeat != lastBeat)
	{
		halfBeatCounter++;
		if (halfBeatCounter >= 2)
		{
			halfBeatCounter = 0;
		}
	}
	
	lastStep = curStep;
	lastBeat = curBeat;
}


notesCreate = function()
{
	
	notesFinished = true;
}

