//Key Input
get_controls();

in_air_prev = in_air;

//X Movement
	//Direction and X speed
	if(!stunned && !dashing){
		move_dir = right_key - left_key;
		move_spd = move_spd_default;
	}
	else if(!stunned && dashing) {
		move_dir = right_key - left_key;
		if((move_dir == prev_move_dir) || move_dir == 0) {
			move_spd = dash_spd;
			move_dir = prev_move_dir;
		}
		else {
			move_spd = move_spd_default;
			dashing = false;
		}
	}
	
	//Dashing chestnut
	if(!stunned && chestnut_key && global.chestnut_collected && (move_dir != 0) && !dashing) {
		//Check if there is enough space to summon chestnut
		if(dashing || (!dashing && (!place_meeting(x, y-8, collision_objs) || !place_meeting(x, y+8, collision_objs)))){
			dashing = true;
			//Starting dash
			yspd = 0;
			if(place_meeting(x, y+16, collision_objs)){
				y -= 16;
			}
			chestnut_id = instance_create_layer(x, y+16, "Instances", obj_chestnut_dash);
		}
	}
	
	if (move_dir != 0) {
		prev_move_dir = move_dir
	}
	if(!stunned){
		xspd = move_dir * move_spd;
	}
	//X Collision
	if(place_meeting(x + xspd,y,collision_objs)){
		xspd = 0;
	}

//Y Movement
	//Gravity
	if(!stunned){
		yspd += grav;
	}
	
	//Y Collision
	if(!stunned && place_meeting(x,y+yspd, collision_objs)){
		
		if(!place_meeting(x, y+yspd, obj_chestnut_dash) && (yspd > 0)){
			dashing = false;	
		}
		
		//Reset jumps if going down
		if(yspd >= 0) {
			in_air = false;
			if(in_air != in_air_prev){
				audio_play_sound(snd_squ_land, 10, false, 1, 0.3, 4);
			}
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
			if(global.cashew_collected){
				double_jump = true;
			}
			audio_play_sound(snd_squ_jmp, 10, false, 1, 0.1, 3);
			keyboard_clear(vk_space);
			in_air = true;
		}
	}
	//Wall Jumping
	else if(!stunned && jump_buffer && global.peanut_collected && wall_jump_counter > 0 && !place_meeting(x,y+yspd, collision_objs) && place_meeting(x+(move_dir*5),y,collision_objs)){
		jump_btimer = 0;
		jump_buffer = 0;
		wall_jump_counter--;
		yspd = jspd;
		xspd = -(prev_move_dir*8);
		dashing = false;
		audio_play_sound(snd_squ_jmp, 10, false, 1, 0.1, 3);
		keyboard_clear(vk_space);
	}
	//Double jumping
	else if(!stunned && global.cashew_collected && jump_buffer && double_jump && !place_meeting(x, y+yspd, collision_objs) && (!place_meeting(x+(move_dir*move_spd),y,collision_objs) || wall_jump_counter <= 0)) {
		if(place_meeting(x, y+12, collision_objs)){
			double_jump = true;
		}
		else {
			double_jump = false;	
		}
		jump_btimer = 0;
		jump_buffer = 0;
		yspd = jspd;
		audio_play_sound(snd_squ_jmp, 10, false, 1, 0.1, 3);
		keyboard_clear(vk_space);
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
		instance_create_layer(x, y-1, "Instances", obj_almond_proj);
		almond_cd = true;
		alarm_set(0, 60);
	}

	//Collision general
	if(place_meeting(x, y, collision_objs)){
		if(place_meeting(x, y-5, collision_objs)){
			yspd = 1;
		}
		else if(place_meeting(x, y+5, collision_objs)){
			yspd = -1;
		}
		
		if(place_meeting(x+5, y, collision_objs)) {
			xspd = -1;	
		}
		else if(place_meeting(x-5, y, collision_objs)) {
			xspd = 1;	
		}
	}
	
	if(!place_meeting(x, y+8, collision_objs)) {
		in_air = true;	
	}

	//Enemy/Hostile environment collision
	if(place_meeting(x, y, hostile_obj) && !invincible) {
		player_health -= 1;
		
		if(player_health <= 0) {
			game_restart();
		}
		else {
			var _obj_other = instance_place(x, y, hostile_obj);
			if(_obj_other.object_index != obj_spike) {
				if(x < _obj_other.x) {
					xspd = -2;
				}
				else {
					xspd = 2;
				}
			}
		
		
			if(y < _obj_other.y) {
				if(_obj_other.object_index == obj_spike) {
					yspd = -5;	
				}
				else {
					yspd = -2;
				}
			}
			else {
				yspd = 2;	
			}
		
			alarm_set(5, 10);
			alarm_set(6, 40);
			stunned = true;
			invincible = true;
		}
	}

//Move
x += xspd;
y += yspd;