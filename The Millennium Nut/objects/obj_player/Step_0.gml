//Key Input
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
jump_key = keyboard_check_pressed(vk_space);


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
	if(jump_key && place_meeting(x,y+1, obj_wall)){
		yspd = jspd;
	}
	//Y Collision
	if(place_meeting(x,y+yspd, obj_wall)){
		yspd = 0;
	}
	//Terminal Velocity
	if(yspd > terminal_velocity){
		yspd = terminal_velocity;
	}

//Move
x += xspd;
y += yspd;