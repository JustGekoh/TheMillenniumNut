//Fullscreen
if(keyboard_check_pressed(vk_f11)){
	window_set_fullscreen(!window_get_fullscreen());
}

//Exit if there is no player
if(!instance_exists(obj_player)){
	exit;
}

//Getting camera size
var camera_width = camera_get_view_width(view_camera[0]);
var camera_height = camera_get_view_height(view_camera[0]);

//Get player position, constrained to room margins
var xCam = clamp(obj_player.x - camera_width / 2, 0, room_width - camera_width);
var yCam = clamp(obj_player.y - camera_height / 2, 0, room_height - camera_height);

//Get the current position of the game camera
var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

//Slowly interpolate towards current player position
var newX = lerp(curX, xCam, 0.5);
var newY = lerp(curY, yCam, 0.5);

//Setting the cameras coordinates
if(snap_to_player) {
	camera_set_view_pos(view_camera[0], xCam, yCam);
	snap_to_player = false;
}
else {
	camera_set_view_pos(view_camera[0], newX, newY);
}