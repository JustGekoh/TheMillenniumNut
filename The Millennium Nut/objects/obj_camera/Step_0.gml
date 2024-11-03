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

//Getting camera coordinates
var camera_x = obj_player.x - camera_width/2;
var camera_y = obj_player.y - camera_height/2;

//Constrain camera to room edges
camera_x = clamp(camera_x, 0, room_width - camera_width);
camera_y = clamp(camera_y, 0, room_height - camera_height);

//True cam
true_cam_x += (camera_x - true_cam_x) * trail_spd;
true_cam_y += (camera_y - true_cam_y) * trail_spd;

//Setting the cameras coordinates
camera_set_view_pos(view_camera[0], true_cam_x, true_cam_y);