angle += rotation_spd;

yspd += grav;
if (yspd > terminal_velocity) {
	yspd = terminal_velocity;	
}

//Y Collision
	if(place_meeting(x,y+yspd, collision_objs)){
		yspd = 0;
	}

y += yspd;

if(id == obj_player.chestnut_id && ((x > (obj_player.x + 64)) || (x < obj_player.x))){
	obj_player.dashing = false;
	persistent = false;
	alarm_set(0, 500);
}

if (place_meeting(x+xspd, y, collision_objs)){
	instance_destroy();
}
else {
	x += xspd;	
}