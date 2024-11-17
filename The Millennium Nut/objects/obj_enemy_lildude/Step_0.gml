switch(state) {
	case IDLE:
	speed = 4;
	if(place_meeting(x - speed, y, collision_objs) || place_meeting(x + speed, y, collision_objs) || 
	   !place_meeting(x + 48, y + 48, collision_objs) || !place_meeting(x - 48, y + 48, collision_objs)){
		if(direction == 0){
			direction = 180;
			x -= 5;
		}
		else {
			direction = 0;	
			x += 5;
		}
		image_xscale *= -1;
	}

	yspd += grav;

	if(place_meeting(x, y+yspd, collision_objs)){
		yspd = 0;
	}
	else if(yspd > terminal_velocity) {
	 yspd = terminal_velocity;	
	}
	
	if(place_meeting(x, y, obj_player)) {
		state = STUNNED;
		alarm_set(0, 40);
	}
	if(place_meeting(x, y, obj_almond_proj)) {
		state = STUNNED;
		alarm_set(0, 40);
		lildude_health -= 1;
		with (instance_place(x, y, obj_almond_proj)) {
				instance_destroy();	
		}
		if(lildude_health <= 0){
			instance_destroy();	
		}
	}

	y += yspd;
	break;
	
	case STUNNED:
	speed = 0;
	break;
}
