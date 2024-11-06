/// @description Player collision

// Change room when player collides with obj_warp
if (place_meeting(x, y, obj_player)) {
	if(x_overwrite) {
		obj_player.x = x_position;
	}
	if(y_overwrite) {
		obj_player.y = y_position;	
	}
	room_goto(rm_next);
}