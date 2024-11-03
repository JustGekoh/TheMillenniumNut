/// @description Player collision

if (place_meeting(x, y, obj_player)) {
	obj_player.x = x_position;
	obj_player.y = y_position;
	room_goto(rm_next);
}