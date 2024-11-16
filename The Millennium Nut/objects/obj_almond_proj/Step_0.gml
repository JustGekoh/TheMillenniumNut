if(move_dir < 0) {
	image_angle = 90;	
}
else {
	image_angle = 270;
}

x += xspd;

if (place_meeting(x, y, collision_objs)) {
	with (instance_place(x, y, obj_wall_break)) {
		instance_destroy();	
	}
	instance_destroy();	
}
