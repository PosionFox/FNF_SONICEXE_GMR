// load the users scores / options
// usually run at the beginning of the game
function load_data()
{
	ini_open("playerdata.save");
	// loop through each week and load all the weeks scores
	for (var i = 0; i <= global.weeks; ++i) {
		global.weekScoreEasy[i] = ini_read_real("Week" + string(i) + "Score", "Easy", 0);
		global.weekScoreNormal[i] = ini_read_real("Week" + string(i) + "Score", "Normal", 0);
		global.weekScoreHard[i] = ini_read_real("Week" + string(i) + "Score", "Hard", 0);
	}
	ini_close();
	
	// options
	ini_open("options.ini");
	
	window_set_fullscreen(ini_read_real("Options", "Fullscreen", false));
	global.advancedHud = ini_read_real("Options", "AdvancedHud", false);
	global.offset = ini_read_real("Options", "Offset", 0);
	global.downScroll = ini_read_real("Options", "Downscroll", false);
	global.middle_scroll = ini_read_real("Options", "Middlescroll", false);
	global.audioSyncGroup = ini_read_real("Options", "AudioSyncGroup", false);
	
	global.particles = ini_read_real("Graphics", "Particles", true);
	gpu_set_texfilter(ini_read_real("Graphics", "Smoothing", true));
	global.customFreeplay = ini_read_real("Graphics", "CustomFreeplay", true);
		
	// keybinds
	global.leftKeybind = ini_read_real("Keybinds", "Left", 65);
	global.downKeybind = ini_read_real("Keybinds", "Down", 83);
	global.upKeybind = ini_read_real("Keybinds", "Up", 87);
	global.rightKeybind = ini_read_real("Keybinds", "Right", 68);
	
	global.acceptKeybind = ini_read_real("Keybinds", "Accept", 90);
	global.backKeybind = ini_read_real("Keybinds", "Back", 88);
	
	ini_close();
}

function loadSongData(_file, loadChart = true)	// jsontoini overseeder, takes in a file and returns a struct
{
	show_debug_message("trying to load song:");
	show_debug_message(_file);
	var _data;
	if (file_exists(_file))
	{
		var _buff = buffer_load(_file);
		var _string = buffer_read(_buff, buffer_string);
		buffer_delete(_buff);
		_data = json_parse(_string);
		show_debug_message("song data loaded successfully");
	}
	else
	{
		show_debug_message("file does not exists");
		return -1;
	}
	
	var notes_output = ds_grid_create(8,16);
	var songStruct = _data.song;	// fetch the actual song object
	
	var player = songStruct.player1;
	var opponent = songStruct.player2;
	var strStage = songStruct[$ "stage"];
	var songName = songStruct.song;
	var sections = [];
	if (loadChart)
	{
		sections = songStruct.notes;
	}
	var bpm = songStruct.bpm;
	
	var crochet = 60 / bpm;
	var stepCrochet = crochet / 4;
	//var curSection = floor(audio_sound_get_track_position(global.music) / (16 * stepCrochet));
	
	var noteSpeed = songStruct.speed * 4;
	//var noteSpeed = bpm / 20;
	//var camSpeed = bpm * 2.6;
	var scrollSpeed = bpm * noteSpeed;
	var posCoefficient = (noteSpeed) * (100 / (scrollSpeed / 48));
	//var posCoefficient = noteSpeed * 10;
	var pixelsToSeconds = noteSpeed * 120;
	
	var lastSection = 1;
	
	if (loadChart)
	{
		for (var i = 0; i < array_length(sections); i++)	// loop sections content
		{
			var sectionNotes = sections[i][$ "sectionNotes"];
			var lengthInSteps = sections[i][$ "lengthInSteps"];
			var typeOfSection = sections[i][$ "typeOfSection"];
			var mustHitSection = sections[i][$ "mustHitSection"];
		
			for (var j = 0; j < array_length(sectionNotes); j++)	// loop notes content
			{
				var note = sectionNotes[j];
				var strumTime = note[0];	// time in milliseconds
				var noteType = note[1];
				var susLength = note[2];	// sustain length in milliseconds
				if (is_string(susLength)) { susLength = 1; }	// ignore strings
				//var noteDuration = _noteDuration / 14.151;	//magic
				if (susLength > 1) { susLength--; }
				var susLengthPixels = (susLength) * (noteSpeed);	//	convert to pixels
				
			
				var calculatedPos = strumTime * (pixelsToSeconds / 1000);
				//var calculatedPos = strumTime / 8.825;
				var noteY = calculatedPos / posCoefficient;
				
				//var noteY = ((strumTime / 1000) / stepCrochet) - (curSection * 16);
			
				if (mustHitSection) { noteType = (noteType + 4) % 8; }
			
				if (noteY >= ds_grid_height(notes_output)) { ds_grid_resize(notes_output, 8, noteY + 1); }
			
				// create cam notes
				if (lastSection != mustHitSection) { place_camera(notes_output, noteType, noteY); }
				lastSection = mustHitSection;
				ds_grid_set(notes_output, noteType, noteY, 1 + susLengthPixels);
			}
		}
	}
	
	//var trueSongName = string_copy(_file, string_last_pos("\\", _file) + 1, string_length(_file));
	//trueSongName = string_copy(trueSongName, 0, string_last_pos(".", trueSongName) - 1);
	//if (string_pos("-", trueSongName)) trueSongName = string_copy(trueSongName, 0, string_last_pos("-", trueSongName) - 1);
	//trueSongName = string_replace_all(trueSongName, "-", "_");
	//trueSongName = string_upper_first(string_lower(trueSongName));
	var trueSongName = string_replace_all(songName, "-", "_");
	trueSongName = string_replace_all(trueSongName, " ", "_");
	
	var trueDif = string_copy(_file, string_last_pos("-", _file) + 1, string_length(_file));
	var _difficulty;
	
	switch (trueDif)	// calculate difficulty
	{
		case "easy.json": _difficulty = 0; break;
		case "hard.json": _difficulty = 2; break;
		default: _difficulty = 1; break;
	}
	
	var _songData = {	// build the song data struct
		player1 : player,
		player2 : opponent,
		stage : strStage,
		song : songName,
		name : trueSongName,
		instFile : trueSongName + "_Inst",
		voiceFile : trueSongName + "_Voices",
		difficulty : _difficulty,
		noteOutput : ds_grid_write(notes_output),
		camSpeed : scrollSpeed,
		bpm : bpm,
		speed : noteSpeed,
		enemy : 1,
		notes : sections
	};
	
	return _songData;
}

