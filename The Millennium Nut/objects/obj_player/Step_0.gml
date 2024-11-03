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
	if(jump_buffer && wall_jump_counter > 0 &&place_meeting(x,y+1, obj_wall) == false && place_meeting(x+(move_dir*move_spd),y,obj_wall)){
		jump_btimer = 0;
		jump_buffer = 0;
		wall_jump_counter--;
		yspd = jspd;
		xspd = -(move_dir*20);
	}
	
	//Y Collision
	if(place_meeting(x,y+yspd, obj_wall)){
		wall_jump_counter = 3;
		yspd = 0;
	}
	//Terminal Velocity
	if(yspd > terminal_velocity){
		yspd = terminal_velocity;
	}

//Move
x += xspd;
y += yspd;