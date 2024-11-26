
if(obj_player.prev_move_dir != 0){
	move_dir = obj_player.prev_move_dir;
}
else {
	move_dir = 1;	
}

if(move_dir < 0) {
	image_angle = 312;	
}
else {
	image_angle = 135;
}


xspd = move_dir * 7;

alarm_set(0, 500);

collision_objs = [obj_wall, obj_wall_break];