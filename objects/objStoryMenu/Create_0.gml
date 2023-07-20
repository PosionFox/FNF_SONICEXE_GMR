
function week(name, songs) constructor
{
	self.name = name ?? "";
	self.songs = songs ?? ["tutorial"];
}

animate = 0;
bfAnimate = 0;

yOffset = 0;
yOffsetTo = 0;

difOffset = 0;
leftArrowScale = 1;
leftArrowScaleTo = 1;
rightArrowScale = 1;
rightArrowScaleTo = 1;

selectedWeek = 0;
//weekName[0] = "";
//weekName[1] = "DADDY DEAREST";
//weekName[2] = "SPOOKY MONTH";
//weekName[3] = "PICO";
//weekName[4] = "MOMMY MUST MURDER";
//weekName[5] = "RED SNOW";
//weekName[6] = "HATING SIMULATOR FT. MOAWLING";
//weekName[7] = "TANKMAN";

weeks = [
	new week(, ["tutorial"]),
	new week("DADDY DEAREST", ["bopeebo", "fresh", "dad-battle"]),
	new week("SPOOKY MONTH", ["spookeez", "south", "monster"]),
	new week("PICO", ["pico", "philly-nice", "blammed"]),
	new week("MOMMY MUST MURDER", ["satin-panties", "high", "milf"]),
	new week("RED SNOW", ["cocoa", "eggnog", "winter-horrorland"]),
	new week("HATING SIMULATOR FT. MOAWLING", ["senpai", "roses", "thorns"])
]

selected = false;
selectedTimer = 0;

scorDisplay = 0;

input = {
	enter : false,
	up : false,
	down : false,
	left : false,
	right : false,
	back : false
}

