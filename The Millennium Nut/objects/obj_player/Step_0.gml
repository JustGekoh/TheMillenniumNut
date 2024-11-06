//Key Input
get_controls();


//X Movement
	//Direction and X speed
	move_dir = right_key - left_key;
	if (move_dir != 0) {
		prev_move_dir = move_dir
	}
	xspd = move_dir * move_spd;
	//X Collision
	if(place_meeting(x + xspd,y,collision_objs)){
		xspd = 0;
	}

//Y Movement
	//Gravity
	yspd += grav;
	//Jumping
	if(jump_buffer && place_meeting(x,y+1, collision_objs)){
		jump_btimer = 0;
		jump_buffer = 0;
		yspd = jspd;
		if(global.cashew_collected) {
			double_jump = true;	
		}
	}
	
	//Wall Jumping
	if(jump_buffer && global.peanut_collected && wall_jump_counter > 0 && place_meeting(x,y+1, collision_objs) == false && (place_meeting(x-5,y,collision_objs) || place_meeting(x+5,y,collision_objs))){
		jump_btimer = 0;
		jump_buffer = 0;
		wall_jump_counter--;
		yspd = jspd;
		xspd = -(prev_move_dir*20);
	}
	
	//Double jumping
	if(jump_buffer && double_jump && !place_meeting(x, y+1, collision_objs) && !place_meeting(x+(move_dir*move_spd),y,collision_objs)) {
		double_jump = false;
		yspd = jspd;
	}
	
	//Y Collision
	if(place_meeting(x,y+yspd, collision_objs)){
		wall_jump_counter = 3;
		yspd = 0;
	}
	
	//Terminal Velocity
	if(yspd > terminal_velocity){
		yspd = terminal_velocity;
	}
	
	if (almond_key && global.almond_collected) {
		instance_create_layer(x+32, y+32, "Instances", obj_almond_proj);
	}

//Move
x += xspd;
y += yspd;