
var trackPosToDisplay = audio_sound_get_track_position(global.music);
draw_text(1003, 55 + (20 * 0), string(trackPosToDisplay) + " / " + string(audio_sound_length(global.music)));
draw_text(1003, 55 + (20 * 1), "Gridheight: " + string(ds_grid_height(global.chart)));
