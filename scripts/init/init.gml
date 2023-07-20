
global.tgLoadMethod = "dynamic";
global.songData = {};
global.chart = ds_grid_create(8, 16);
global.events = array_create(16, 0);
global.chartNotes = [];
global.song = Tutorial_Inst;
global.voices = "";
global.songId = 0;
global.voicesId = 0;
global.bpm = 100;
global.noteSpeed = 5;
global.camSpeed = 360; // BPM * 2.85256410256
global.songName = "Tutorial";
global.hideArrows = false;

global.boyfriend = "og";

// the current score, and combo
global.curScore = 0;
global.combo = 0;

global.songIsPlaying = false;
global.previousLoadedSprites = [0];

// voice muting
global.playVoice = 1;

// story mode variables
global.weekPlaying = 0;
global.songOn = 0;
global.songScore[0] = 0;
global.nextSong[0] = "";

// enemy variables
global.enemy = 0; // 0 - gf, 1 - dad, 2 - spooky, 3 - monster, 4 - pico, 5 - mom, 6/7 - parents & monster, 8/9/10 - senpai, 11 - tankman
// special enemys 100/101 - whitty, 102 - oxi
global.turn = true;

global.dead = false; // is the player dead

// camera variables
global.camWidth = 1280;
global.camHeight = 720;
global.camZoom = 1;

// mods
global.auto = false;
global.fastnotes = false;
global.slownotes = false;
global.vanish = false;
global.nofail = false;
global.flashlight = false;
global.fragile = false;
global.flipped = false;
global.accelnotes = false;

global.currentMultiplier = 1;

// freeplay variables
global.specialSongs = false;
global.bSides = false;

// settings
global.offset = 0;
global.advancedHud = false;
global.downScroll = false;
global.middle_scroll = false;

global.volume = 1;
global.controller = 1;

global.particles = true;
global.customFreeplay = true;

global.fullscreen = false;
global.audioSyncGroup = false;
global.ghostTapping = true;
global.discordEnabled = false;
global.antiAliasing = true;

// controls
global.leftKeybind = 65;
global.downKeybind = 83;
global.upKeybind = 87;
global.rightKeybind = 68;
global.acceptKeybind = 90;
global.backKeybind = 88;

// week variables
global.freeplay = false;
global.weeks = 6;
for (var i = 0; i < global.weeks + 1; ++i) {
	global.weekScoreEasy[i] = 0;
	global.weekScoreNormal[i] = 0;
	global.weekScoreHard[i] = 0;
}
global.currentDif = 1;

// check where data should be saved / loaded
// if useprogramdir is on, it will check in where the program is stored
// codist only changes this because his computer is stupid
global.useProgramDir = true;

global.chaMonochrome = "1f72c3fc-92fb-4690-a177-e712f36bbd14";
global.chaInsomnia = "7b03fa6f-f9a0-4944-a6a8-28f03e2ab0a5"
global.chaCurrent = gxc_get_query_param("challenge") ?? "";
