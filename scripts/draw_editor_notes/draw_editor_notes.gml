// draw the notes in the editor depending on their place in the ds_grid
// !!! EXTREMELY UNOPTIMIZED, PRIORITY IN OPTIMIZATION
function draw_editor_notes(noteGrid, _x, _y)
{
	var gridW = ds_grid_width(noteGrid);
	var gridH = ds_grid_height(noteGrid);
	
	for (var gY = 0; gY < gridH; gY++)
	{
		for (var gX = 0; gX < gridW; gX++)
		{
			if (ds_grid_get(noteGrid, gX, gY) != 0)
			{
				var val = (ds_grid_get(noteGrid, gX, gY) - 1) / 10;
				
				var sprToDraw = sprNotes;
				if (val <= -1) sprToDraw = sprDebugNotes; // if the note is negative (which means its used for camera, etc.) change the sprite
				
				 // figure out where to draw the sprite based on maths
				var sprX = _x + (gX * 40) + 20;
				var sprY = _y + (gY * 40) + 20;
				
				// draw stuff
				draw_sprite_ext(sprToDraw, gX, sprX, sprY, 0.28, 0.28, 0, c_white, 1); // draw the actual notes
				draw_set_color(c_black);
				draw_text(sprX, sprY, val); // draw the notes value
				draw_set_color(c_white);
				if (val > 1) draw_line_width(sprX, sprY, sprX, sprY + val * 6 + 15, 10); // draw a inaccurate but close enough replacement for hold notes 
			}
		}
	}
}

function draw_event_notes(array, _x, _y)
{
	var n = array_length(array);
	
	for (var i = 0; i < n; i++)
	{
		var value = array[i];
		if (value != 0)
		{
			var xx = _x + (0 * 40);
			var yy = _y + (i * 40);
			draw_sprite_ext(sprEventArrow, 0, xx, yy, 0.28, 0.28, 0, c_white, 1);
		}
	}
}
