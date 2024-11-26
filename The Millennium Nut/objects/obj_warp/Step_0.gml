/// @description Player collision

// Change room when player collides with obj_warp
if (place_meeting(x, y, obj_player)) {
	if(x_overwrite) {
		obj_player.x = x_position;
		if(instance_exists(obj_chestnut_dash)){
			obj_chestnut_dash.x = x_position;	
		}
	}
	if(y_overwrite) {
		obj_player.y = y_position;	
		if(instance_exists(obj_chestnut_dash)){
			obj_chestnut_dash.y = y_position;	
			obj_player.y -= 16;
		}
	}
	room_goto(rm_next);
	
	save_game(room_get_name(rm_next));
}