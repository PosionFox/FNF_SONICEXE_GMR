
if (mouse_wheel_down())
{
	camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]) + 32);
}
if (mouse_wheel_up())
{
	camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]) - 32);
}



