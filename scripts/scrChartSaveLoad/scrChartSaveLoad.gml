// this script is used to save a chart created using the editor
// to a ini file which can be loaded when needed using load_chart();
function save_chart(dif){
	// change the saved difficullty at the end of the file
	var difName = "_Easy";
	if (dif = 1) difName = "_Normal";
	if (dif = 2) difName = "_Hard";
	
	// choose the directory to save in depending on if the game is being run in the ide, or as a released build
	var directory = global.songName + "\\" + global.songName + difName + ".ini";
	if (global.useProgramDir) directory = working_directory + "\\Songs\\" + directory;
	
	// save all the songs data
	ini_open(directory);
	if (global.songName = "") {exit; ini_close();} // if there is no song name, give up on saving
	ini_write_string("Song", "Name", global.songName);
	
	ini_write_string("Song", "Song File", audio_get_name(global.song));
	if (global.voices = "") ini_write_string("Song", "Vocal File", ""); // if there are no vocals, save it as nothing
	else ini_write_string("Song", "Vocal File", audio_get_name(global.voices));
	
	ini_write_real("Song", "Notespeed", global.noteSpeed);
	ini_write_real("Song", "BPM", global.bpm);
	ini_write_real("Song", "Camspeed", global.camSpeed);
	ini_write_real("Song", "Enemy", global.enemy);
	
	ini_write_string("Song", "Notes", ds_grid_write(global.chart));
	ini_close();
}

// this script is used to load a chart created using the editor
function load_chart(songNam, dif)
{
	// change the saved difficullty at the end of the file
	var difName = "_Easy";
	if (dif = 1) difName = "_Normal";
	if (dif = 2) difName = "_Hard";
	
	// choose the directory to load in depending on if the game is being run in the ide, or as a released build
	var directory = "\\Songs\\" + songNam + "\\" + songNam + difName + ".ini";
	if (global.specialSongs) directory = "\\Custom" + directory;
	directory = working_directory + directory;
	
	// load all of the songs data
	ini_open(directory);
	if (songNam = "") {exit; ini_close();} // if the song being loaded's name is "", then give up on loading the file
	global.songName = ini_read_string("Song", "Name", global.songName);
	global.song = asset_get_index(ini_read_string("Song", "Song File", "Dadbattle_Inst"));
	global.voices = ini_read_string("Song", "Vocal File", "Dadbattle_Voices");
	if (global.voices != "") global.voices = asset_get_index(global.voices);
	
	global.noteSpeed = ini_read_real("Song", "Notespeed", global.noteSpeed);
	global.bpm = ini_read_real("Song", "BPM", global.bpm);
	global.camSpeed = ini_read_real("Song", "Camspeed", global.camSpeed);
	global.enemy = ini_read_real("Song", "Enemy", global.enemy);
	
	ds_grid_read(global.chart, ini_read_string("Song", "Notes", ds_grid_create(8, 16)));
	ini_close();
}


function saveSongChart(_file) // wip
{
	// save all the songs data
	var dataStruct = {
		song : {}
	};
	
	with (dataStruct.song)
	{
		song = global.songName;
		player1 = global.songData[$ "player1"];
		player2 = global.songData[$ "player2"];
		sectionLengths = [];
		validScore = true;
		sections = 0;
		needsVoices = true;
		bpm = global.bpm;
		speed = global.noteSpeed / 4;
		
		notes = global.chartNotes;
	}
	
	var _string = json_stringify(dataStruct);
	
	var _buff = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buff, buffer_string, _string);
	buffer_save(_buff, _file);
	buffer_delete(_buff);
	
	/*
	ini_open(directory);
	if (global.songName = "") {exit; ini_close();} // if there is no song name, give up on saving
	ini_write_string("Song", "Name", global.songName);
	
	ini_write_string("Song", "Song File", audio_get_name(global.song));
	if (global.voices = "") ini_write_string("Song", "Vocal File", ""); // if there are no vocals, save it as nothing
	else ini_write_string("Song", "Vocal File", audio_get_name(global.voices));
	
	ini_write_real("Song", "Notespeed", global.noteSpeed);
	ini_write_real("Song", "BPM", global.bpm);
	ini_write_real("Song", "Camspeed", global.camSpeed);
	ini_write_real("Song", "Enemy", global.enemy);
	
	ini_write_string("Song", "Notes", ds_grid_write(global.chart));
	ini_close();*/
}

function loadSongChart(_name)
{
	_name = string_replace_all(_name, "_", "-");
	_name = string_replace_all(_name, " ", "-");
	var difficulty = fetchDifficultyName(global.currentDif);
	var directory = "data/" + string(_name) + "/" + string(_name) + string(difficulty) + ".json";
	var _parsedName;
	
	var songStruct = loadSongData(directory);
	if (songStruct == -1)
	{
		show_debug_message("could not load song data");
		return songStruct;
	}
	
	//global.intactSongData = songStruct;
	
	_parsedName = string_replace_all(songStruct.song, "-", "_");
	_parsedName = string_replace_all(_parsedName, " ", "_");
	show_debug_message("parsed song name: " + _parsedName);
	
	global.songData = songStruct;
	global.songName = songStruct.song;
	global.stage = global.songData[$ "stage"];
	if (global.stage == undefined)
	{
		global.stage = stage_autodetect_by_song(global.songName);
	}
	show_debug_message("stage: " + string(global.stage));
	global.song = asset_get_index(string(_parsedName) + "_Inst");
	global.voices = asset_get_index(string(_parsedName) + "_Voices");
	//if (global.voices != "") { global.voices = asset_get_index(global.voices); }
	
	//global.noteSpeed = songStruct.speed * 4;
	global.noteSpeed = songStruct.speed;
	global.bpm = songStruct.bpm;
	global.camSpeed = songStruct.camSpeed;
	global.enemy = fetchOpponentId(songStruct.player2);
	
	ds_grid_read(global.chart, songStruct.noteOutput);
	global.chartNotes = songStruct.notes;	// sections
	
}

function stage_autodetect_by_song(songName)
{
	switch (string_lower(songName))
	{
		case "bopeebo":
			return "stage";
		break;
		case "fresh":
			return "stage";
		break;
		case "dad battle":
			return "stage";
		break;
		
		case "spookeez":
			return "spooky";
		break;
		case "south":
			return "spooky";
		break;
		case "monster":
			return "spooky";
		break;
		
		case "pico":
			return "pico";
		break;
		case "philly nice":
			return "pico";
		break;
		case "blammed":
			return "pico";
		break;
		
		case "satin panties":
			return "limo";
		break;
		case "high":
			return "limo";
		break;
		case "milf":
			return "limo";
		break;
		
		case "cocoa":
			return "christmas";
		break;
		case "eggnog":
			return "christmas";
		break;
		case "winter horrorland":
			return "scary";
		break;
		
		case "senpai":
			return "senpai";
		break;
		case "roses":
			return "senpaimad";
		break;
		case "thorns":
			return "evilschool";
		break;
		
		case "insomnia":
			return "feralisleep";
		break;
		case "monochrome":
			return "darkness";
		break;
		
		case "improbable-outset":
			return "nevada1";
		break;
		
		default:
			return "stage";
		break;
	}
}

function stage_get_room(name)
{
	switch (name)
	{
		case "alt":
			return rmGoddess;
		break;
		case "requite":
			return rmForestallDesire;
		break;
		default:
			return rmGoddess;
		break;
	}
}

function fetchOpponentId(_string)
{
	var _id = 1;
	
	switch (_string)
	{
		case "bf": _id = 0; break;
		case "bf-car": _id = 103; break;
		case "bf-christmas": _id = 103; break;
		case "bf-pixel": _id = 103; break;
		case "dad": _id = 1; break;
		case "gf": _id = 0; break;
		case "mom": _id = 5; break;
		case "mom-car": _id = 5; break;
		case "monster": _id = 3; break;
		case "monster-christmas": _id = 7; break;
		case "parents-christmas": _id = 6; break;
		case "pico": _id = 4; break;
		case "senpai": _id = 8; break;
		case "senpai-angry": _id = 9; break;
		case "spirit": _id = 10; break;
		case "spooky": _id = 2; break;
		case "tankman": _id = 11; break;
		case "whit": _id = 100; break;
		case "whitbonkers": _id = 101; break;
		case "oxi": _id = 102; break;
	}
	
	return _id;
}

function fetchDifficultyName(_num)
{
	var _difficulty;
	
	switch (_num)
	{
		case 0: _difficulty = "-easy"; break;
		case 1: _difficulty = ""; break;
		case 2: _difficulty = "-hard"; break;
	}
	return string(_difficulty);
}

/**
 * Returns a struct with character sprites
 * @param {string} name name of the character
 * @returns {struct} struct with sprites
 */
function character_get_sprites(name) // only for player
{
	var sprites = {
		idle : sprBoyfriendIdle,
		up : sprBoyfriendUp,
		left : sprBoyfriendLeft,
		down : sprBoyfriendDown,
		right : sprBoyfriendRight,
		upMiss : sprBoyfriendUpMiss,
		leftMiss : sprBoyfriendLeftMiss,
		downMiss : sprBoyfriendDownMiss,
		rightMiss : sprBoyfriendRightMiss,
		cheer : sprBoyfriendCheer,
		die : sprBoyfriendDie
	};
	switch (name)
	{
		case "bf":
			sprites.idle = sprBoyfriendIdle;
			sprites.up = sprBoyfriendUp;
			sprites.left = sprBoyfriendLeft;
			sprites.down = sprBoyfriendDown;
			sprites.right = sprBoyfriendRight;
			sprites.upMiss = sprBoyfriendUpMiss;
			sprites.leftMiss = sprBoyfriendLeftMiss;
			sprites.downMiss = sprBoyfriendDownMiss;
			sprites.rightMiss = sprBoyfriendRightMiss;
			sprites.cheer = sprBoyfriendCheer;
			sprites.die = sprBoyfriendDie;
		break;
		case "bf-car":
			sprites.idle = sprBoyfriendCarIdle;
			sprites.up = sprBoyfriendCarUp;
			sprites.left = sprBoyfriendCarLeft;
			sprites.down = sprBoyfriendCarDown;
			sprites.right = sprBoyfriendCarRight;
			sprites.upMiss = sprBoyfriendCarUpMiss;
			sprites.leftMiss = sprBoyfriendCarLeftMiss;
			sprites.downMiss = sprBoyfriendCarDownMiss;
			sprites.rightMiss = sprBoyfriendCarRightMiss;
		break;
		case "bf-christmas":
			sprites.idle = sprBoyfriendChristIdle;
			sprites.up = sprBoyfriendChristUp;
			sprites.left = sprBoyfriendChristLeft;
			sprites.down = sprBoyfriendChristDown;
			sprites.right = sprBoyfriendChristRight;
			sprites.upMiss = sprBoyfriendChristUpMiss;
			sprites.leftMiss = sprBoyfriendChristLeftMiss;
			sprites.downMiss = sprBoyfriendChristDownMiss;
			sprites.rightMiss = sprBoyfriendChristRightMiss;
		break;
		case "bf-pixel":
			sprites.idle = sprBoyfriendPixelIdle;
			sprites.up = sprBoyfriendPixelUp;
			sprites.left = sprBoyfriendPixelLeft;
			sprites.down = sprBoyfriendPixelDown;
			sprites.right = sprBoyfriendPixelRight;
			sprites.upMiss = sprBoyfriendPixelUpMiss;
			sprites.leftMiss = sprBoyfriendPixelLeftMiss;
			sprites.downMiss = sprBoyfriendPixelDownMiss;
			sprites.rightMiss = sprBoyfriendPixelRightMiss;
		break;
		case "gf":
			sprites.idle = sprGirlfriendIdle;
			sprites.up = sprGirlfriendUp;
			sprites.left = sprGirlfriendLeft;
			sprites.down = sprGirlfriendDown;
			sprites.right = sprGirlfriendRight;
		break;
		case "tankman":
			sprites.idle = sprTankmanIdle;
			sprites.up = sprTankmanUp;
			sprites.left = sprTankmanLeft;
			sprites.down = sprTankmanDown;
			sprites.right = sprTankmanRight;
		break;
		case "oxi":
			sprites.idle = sprOxiIdle;
			sprites.up = sprOxiUp;
			sprites.left = sprOxiLeft;
			sprites.down = sprOxiDown;
			sprites.right = sprOxiRight;
		break;
	}
	return sprites;
}

/**
 * UNUSED Returns a sprite icon
 * @param {string} name name of the character
 * @returns {asset.GMSprite} Description
 */
function character_get_icon(name)
{
	var icon = sprDadIcon;
	switch (name)
	{
		case "bf":
			icon = sprBfIcon;
		break;
		case "bf-christmas":
			icon = sprBfIcon;
		break;
		case "bf-pixel":
			icon = sprBfIcon;
		break;
		case "dad":
			icon = sprDadIcon;
		break;
		case "gf":
			icon = sprGfIcon;
		break;
		case "mom-car":
			icon = sprMomIcon;
		break;
		case "monster":
			icon = sprMonsterIcon;
		break;
		case "monster-christmas":
			icon = sprMonsterIcon;
		break;
		case "parents-christmas":
			icon = sprParentsIcon;
		break;
		case "pico":
			icon = sprPicoIcon;
		break;
		case "senpai":
			icon = sprSenpaiIcon;
		break;
		case "senpai-angry":
			icon = sprSenpaiMadIcon;
		break;
		case "spirit":
			icon = sprSpiritIcon;
		break;
		case "spooky":
			icon = sprSpookyIcon;
		break;
		case "tankman":
			icon = sprTankmanIcon;
		break;
		case "whit":
			icon = sprWhittyIcon;
		break;
		case "whitbonkers":
			icon = sprWhittyMadIcon;
		break;
		case "oxi":
			icon = sprOxiIcon;
		break;
		case "gold":
			icon = sprGoldIcon;
		break;
		case "silver":
			icon = sprSilverIcon;
		break;
		case "trickyMask":
			icon = sprTrickyMaskIcon;
		break;
	}
	return icon;
}
