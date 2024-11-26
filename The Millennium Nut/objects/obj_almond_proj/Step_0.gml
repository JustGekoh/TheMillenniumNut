x += xspd;

if (place_meeting(x, y, collision_objs)) {
	with (instance_place(x, y, obj_wall_break)) {
		instance_destroy();	
	}
	instance_destroy();	
}
