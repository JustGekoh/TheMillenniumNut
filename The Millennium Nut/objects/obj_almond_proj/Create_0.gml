
if(obj_player.prev_move_dir != 0){
	move_dir = obj_player.prev_move_dir;
}
else {
	move_dir = 1;	
}
xspd = move_dir * 10;

alarm_set(0, 500);

collision_objs = [obj_wall, obj_wall_break];