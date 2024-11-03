//Key Input
get_controls();


//X Movement
	//Direction and X speed
	move_dir = right_key - left_key;
	xspd = move_dir * move_spd;
	//X Collision
	if(place_meeting(x + xspd,y,obj_wall)){
		xspd = 0;
	}

//Y Movement
	//Gravity
	yspd += grav;
	//Jumping
	if(jump_buffer && place_meeting(x,y+1, obj_wall)){
		jump_btimer = 0;
		jump_buffer = 0;
		yspd = jspd;
	}
	
	//Wall Jumping
	if(jump_buffer && wall_jump_counter > 0 && place_meeting(x,y+1, obj_wall) == false && (place_meeting(x-5,y,obj_wall) || place_meeting(x+5,y,obj_wall))){
		jump_btimer = 0;
		jump_buffer = 0;
		wall_jump_counter--;
		yspd = jspd;
		xspd = -(prev_move_dir*20);
	}
	
	//Double jumping
	if(jump_buffer && double_jump && !place_meeting(x, y+1, obj_wall) && !place_meeting(x+(move_dir*move_spd),y,obj_wall)) {
		double_jump = false;
		yspd = jspd;
	}
	
	//Y Collision
	if(place_meeting(x,y+yspd, obj_wall)){
		wall_jump_counter = 3;
		yspd = 0;
		if(global.cashew_collected && !place_meeting(x,y-5,obj_wall)) {
			double_jump = true;
		}
	}
	//Terminal Velocity
	if(yspd > terminal_velocity){
		yspd = terminal_velocity;
	}
if (move_dir != 0) {
	prev_move_dir = move_dir
}

//Move
x += xspd;
y += yspd;