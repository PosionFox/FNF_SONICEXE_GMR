for (var i = 0; i < ds_grid_height(global.chart) / 2; ++i)
{
	draw_sprite(sprDebugEditorGrid, 0, x, y + (i * gridSize * 2));
	draw_sprite(sprEventGrid, 0, x - 40, y + (i * gridSize * 2));
}

draw_rectangle_color(selBoxX, selBoxY, selBoxX + gridSize - 1, selBoxY + gridSize - 1, c_white, c_white, c_white, c_white, false);
if !(dontDraw)
{
	draw_editor_notes(global.chart, x, y);
	draw_event_notes(global.events, x - 40, y);
}

// character heads
var headLeft = 4;
var headRight = 0;

draw_sprite_ext(sprIcons, headLeft, x + 80, y - 30, 0.3, 0.3, 0, c_white, 1);
draw_sprite_ext(sprIcons, headRight, x + 160 + 80, y - 30, 0.3, 0.3, 0, c_white, 1);
draw_text(mouse_x + 16, mouse_y, selBoxX);
draw_text(mouse_x, mouse_y + 16, selBoxY);
