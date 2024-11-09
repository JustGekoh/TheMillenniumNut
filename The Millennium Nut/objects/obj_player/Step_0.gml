//Key Input
get_controls();

//X Movement
	//Direction and X speed
	if(!dashing){
		move_dir = right_key - left_key;
		move_spd = 5;
	}
	else if(dashing) {
		move_dir = right_key - left_key;
		if((move_dir == prev_move_dir) || move_dir == 0) {
			move_spd = dash_spd;
			move_dir = prev_move_dir;
		}
		else {
			move_spd = 5;
			dashing = false;
		}
	}
	
	//Dashing chestnut
	if(chestnut_key && global.chestnut_collected && (move_dir != 0) && !dashing) {
		//Check if there is enough space to summon chestnut
		if(dashing || (!dashing && (!place_meeting(x, y-64, collision_objs) || !place_meeting(x, y+64, collision_objs)))){
			dashing = true;
			//Starting dash
			yspd = 0;
			if(place_meeting(x, y+64, collision_objs)){
				y -= 64;
			}
			chestnut_id = instance_create_layer(x+32, y+64+32, "Instances", obj_chestnut_dash);
		}
	}
	
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
	
	//Y Collision
	if(place_meeting(x,y+yspd, collision_objs)){
		
		if(!place_meeting(x, y+yspd, obj_chestnut_dash) && (yspd > 0)){
			dashing = false;	
		}
		
		//Reset jumps if going down
		if(yspd >= 0) {
			wall_jump_counter = 3;
			if(global.cashew_collected) {
				double_jump = true;	
			}
		}
		
		yspd = 0;
		
		//Jumping
		if(jump_buffer){
			jump_btimer = 0;
			jump_buffer = 0;
			yspd = jspd;
		}
	}
	//Wall Jumping
	else if(jump_buffer && global.peanut_collected && wall_jump_counter > 0 && !place_meeting(x,y+yspd, collision_objs) && (place_meeting(x-5,y,collision_objs) || place_meeting(x+5,y,collision_objs))){
		jump_btimer = 0;
		jump_buffer = 0;
		wall_jump_counter--;
		yspd = jspd;
		xspd = -(prev_move_dir*20);
	}
	//Double jumping
	else if(jump_buffer && double_jump && !place_meeting(x, y+yspd, collision_objs) && (!place_meeting(x+(move_dir*move_spd),y,collision_objs) || wall_jump_counter <= 0)) {
		if(place_meeting(x, y+96, collision_objs)){
			double_jump = true;
		}
		else {
			double_jump = false;	
		}
		yspd = jspd;
	}
	
	//Terminal Velocity
	if(yspd > terminal_velocity){
		yspd = terminal_velocity;
	}
	
	if(place_meeting(x, y+yspd, collision_objs)) {
		yspd = sign(yspd);	
	}
	
	//Shooting almond
	if (almond_key && !almond_cd && global.almond_collected) {
		instance_create_layer(x+32, y+32, "Instances", obj_almond_proj);
		almond_cd = true;
		alarm_set(0, 60);
	}

	if(place_meeting(x, y, collision_objs)){
		if(place_meeting(x, y-10, collision_objs)){
			yspd = 1;
		}
		else if(place_meeting(x, y+10, collision_objs)){
			yspd = -1;
		}
	}

//Move
x += xspd;
y += yspd;