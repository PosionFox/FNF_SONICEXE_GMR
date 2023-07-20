// used bopping code, readded
//if (global.enemy = 5) {
hudBopVsp += 0.1;
//if (hudBopScale > 0) hudBopScale -= hudBopVsp;
//if (hudBopScale < 0) hudBopScale = 0;

if (hudBopTimer >= 120)
{
	hudBopVsp = 0;
	hudBopScale = 0.05;
	hudBopTimer = 0;
}
hudBopTimer += ((global.bpm / 60) / 4) * DTM;

hudBopScale = lerp(hudBopScale, 0, 0.1 * DTM);
hudAlpha = lerp(hudAlpha, hudAlphaTarget, hudAlphaSpd * DTM);
//}

// calculate deltatime
calculateDelta();

// check if song ended
if (variable_global_exists("musicSync") and global.songIsPlaying)
{
	var curTime = 0;
	var finalTime = 0;
	var _audio = global.musicSync;
	var f_pos = audio_sync_group_get_track_pos;
	var f_playing = audio_sync_group_is_playing;
	
	if (!global.audioSyncGroup)
	{
		_audio = global.songId;
		f_pos = audio_sound_get_track_position;
		f_playing = audio_is_playing;
	}
	
	curTime = f_pos(_audio);
	finalTime = audio_sound_length(_audio);
	
	if (!f_playing(_audio))
	{
		timeUntilMoveOn += 0.02 * DTM;
	}
	
	//if (finalTime <= 0) // fix song skip early
	//{
	//	finalTime = 100;
	//}
	
	//if (curTime >= finalTime - 1.1) && (room = MainGame)
	//{
	//	timeUntilMoveOn++;
	//}
}

//if (timeUntilMoveOn >= 420) {
//	oBoyfriend.sprite_index = sBoyfriendCheer;
//	oBoyfriend.image_index = 1;
	
//	oCamera.rankingScreen = true;
//}

// when the song has ended
//if (timeUntilMoveOn >= 420) && !(global.dead) && (keyboard_check_pressed(vk_enter)) {
if (timeUntilMoveOn >= timeUntilMoveOnMax) && !(global.dead)
{
	global.songIsPlaying = false;
	
	
	if (global.audioSyncGroup)
	{
		audio_pause_sync_group(global.musicSync);
	}
	else
	{
		audio_pause_sound(global.songId);
		audio_pause_sound(global.voicesId);
	}
	
	// load the next songs chart
	
	loadSongChart(global.nextSong[global.songOn]);
	var roomTo = stage_get_room(global.stage);
	//load_chart(global.nextSong[global.songOn], global.currentDif);

	if (global.auto) global.curScore = 0;
	global.songScore[global.songOn] = global.curScore;
	
	// if the next song does not exist
	if (global.nextSong[global.songOn] == "")
	{
		roomTo = rmStoryMenu;
		if (global.chaCurrent != "")
		{
			gxc_challenge_submit_score(global.curScore);
			roomTo = rmMainMenu;
		}
		audio_play_sound(sndFreakyMenu, 10, true);
		var totalScore = 0;
		for (var i = 0; i <= global.songOn; ++i)
		{
		    totalScore += global.songScore[i];
		}
		
		// save scores
		if !(global.freeplay) {
			if (global.currentDif = 0) global.weekScoreEasy[global.weekPlaying] = totalScore;
			if (global.currentDif = 1) global.weekScoreNormal[global.weekPlaying] = totalScore;
			if (global.currentDif = 2) global.weekScoreHard[global.weekPlaying] = totalScore;
			save_weekscore(global.weekPlaying, global.currentDif);
		} else {
			save_songscore(global.songName, global.currentDif, global.curScore);
		}
	}
	// move on to the next song
	global.songOn++;
	
	// fade out
	if (global.freeplay) 
	{
		roomTo = rmFreePlay;
		if (global.chaCurrent != "")
		{
			roomTo = rmMainGame;
		}
	}
	if !(roomTo = rmMainGame)
	{
		var o = instance_create_depth(0, 0, -10000, objFade);
		o.roomTo = roomTo;
	}
	else
	{
		if (instance_exists(objCamera))
		{
			oldCamX = objCamera.x;
			oldCamY = objCamera.y;
		} else { show_debug_message("camera does not exist!"); }
		room_goto(roomTo);	
	}
	audio_destroy_sync_group(global.musicSync);
	character_flush_sprites(objBoyfriend);
	character_flush_sprites(objEnemy);
	timeUntilMoveOn = 0;
}

// edit the volume variable
global.volume = clamp(global.volume, 0, 1);
audio_master_gain(global.volume);