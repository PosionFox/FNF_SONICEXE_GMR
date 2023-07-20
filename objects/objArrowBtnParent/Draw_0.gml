/*if (instance_exists(objDialogBox)) exit;

if !(surface_exists(global.hudSurface)) exit;
surface_set_target(global.hudSurface);
if !(global.dead) draw_self();
//draw_line(x, y - 192, x, y + 192);
surface_reset_target();