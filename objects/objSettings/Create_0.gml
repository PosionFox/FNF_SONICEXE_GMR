
input = {
	enter : false,
	up : false,
	down : false,
	left : false,
	right : false,
	back : false
}

#region preferences

catPreferences = new Category("preferences",, function()
{
	menuIndex = 0;
	currentMenu = catPreferences;
});
catPreferences.addSettings([
	new SettingBool("fullscreen", "Switch between fullscreen & windowed mode.", "fullscreen", function() {
		window_set_fullscreen(global.fullscreen);
	}),
	new SettingInt("offset", "Negative Numbers - Late\nPositive Numbers - Early\nShift = +5", "offset", -100, 100),
	new SettingBool("downscroll", "Notes scroll downwards instead of up.\nSimilar to osu!mania.", "downScroll"),
	new SettingBool("middlescroll", "Notes are centered on the screen.", "middle_scroll"),
	new SettingBool("ghost tapping", "You won't miss if there are no notes nearby.", "ghostTapping"),
	new SettingBool("advanced hud", "Adds extra information under the health bar.", "advancedHud"),
	new SettingBool("audio sync", "Improves song synchronization but\nmight mess with the game.", "audioSyncGroup"),
	new SettingBool("discord", "Shows what song you are playing in discord.\n(Requires Restart)", "discordEnabled")
]);

#endregion

#region graphics

catGraphics = new Category("graphics",, function()
{
	menuIndex = 0;
	currentMenu = catGraphics;
});
catGraphics.addSettings([
	new SettingBool("anti-aliasing", "Fixes jagged edges around most sprites.", "antiAliasing", function() {
		gpu_set_texfilter(global.antiAliasing);
	}),
	new SettingBool("particles", "Toggle the particles that appear\nwhen you get a SICK.", "particles"),
	new SettingBool("custom freeplay", "Toggle the custom freeplay art.\nBy @Im~Lotter on Twitter", "customFreeplay")
]);

#endregion

#region keybinds

catKeybinds = new Category("keybinds",, function()
{
	menuIndex = 0;
	currentMenu = catKeybinds;
});
catKeybinds.addSettings([
	new SettingBind("left",, "leftKeybind"),
	new SettingBind("down",, "downKeybind"),
	new SettingBind("up",, "upKeybind"),
	new SettingBind("right",, "rightKeybind"),
	new SettingBind("accept",, "acceptKeybind"),
	new SettingBind("back",, "backKeybind")
]);

#endregion

categories = new Category("options");
categories.addSettings([
	catPreferences,
	catGraphics,
	catKeybinds
]);

currentMenu = categories;
menuIndex = 0;
offsetY = 0;
