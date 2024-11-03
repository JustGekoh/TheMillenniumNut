function control_setup(){
	buffer_time = 6;
	wall_jump_counter = 3;
	jump_buffer = 0;
	jump_btimer = 0;
	
}


function get_controls(){
		//Movement Inputs
		right_key = keyboard_check(vk_right) + gamepad_button_check(0, gp_padr);
		right_key = clamp(right_key, 0,1);
		
		left_key = keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
		left_key = clamp(left_key, 0,1);
		
		jump_key = keyboard_check_pressed(vk_space)+ gamepad_button_check_pressed(0,gp_face1)+gamepad_button_check_pressed(0,gp_padu);
		jump_key = clamp(jump_key, 0,1);
			
		//Jump Buffer
		if(jump_key){
			jump_btimer = buffer_time;
		}
		if(jump_btimer >0 ){
			jump_buffer = 1;
			jump_btimer --;
		}else{
			jump_buffer = 0;
		}
}