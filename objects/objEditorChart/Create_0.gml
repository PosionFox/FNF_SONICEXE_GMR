
song = "bopeebo";
dif = "";

songDataDefault = {
	player1: "bf",
	player2: "dad",
	song: "",
	needsVoices: true,
	speed: 1,
	bpm: 100,
	notes: []
}

songData = undefined;

crochet = 0;
stepCrochet = 0;

curBeat = 0;
curStep = 0;

lastSection = -1;
curSection = 0;

unhitNotes = [];
allowInput = true;

musicStream = undefined;
vocalStream = undefined;


songLoad = function()
{
	songData ??= songLoadJson("data/overhead/overhead-hard.json");
	changeBpm();
}





chartLoad = function(data)
{
	var sections = data.song.notes;
	for (var i = 0; i < array_length(sections); i++)	// loop sections content
	{
		var sectionNotes = sections[i][$ "sectionNotes"];
		var lengthInSteps = sections[i][$ "lengthInSteps"];
		var typeOfSection = sections[i][$ "typeOfSection"];
		var mustHitSection = sections[i][$ "mustHitSection"];	// whos turn is
		
		for (var j = 0; j < array_length(sectionNotes); j++)	// loop notes content
		{
			var note = sectionNotes[j];
			var timeMilliseconds = note[0];
			var column = note[1];
			var sliderDurationMilliseconds = note[2];
			
			if (mustHitSection) { column = (column + 4) % 8; }
			
			instance_create_depth(128 + (40 * column), 0 + (timeMilliseconds / 8.825), depth, objEditorNote, {
				timeMilliseconds : timeMilliseconds,
				column : column,
				sliderDurationMilliseconds : sliderDurationMilliseconds
			});
		}
	}
}


changeBpm = function()
{
	crochet = (60 / songData[$ "bpm"]);
	stepCrochet = (crochet / 4);
}
