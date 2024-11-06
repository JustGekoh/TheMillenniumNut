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
		
		//Almond input
		almond_key = keyboard_check_pressed(ord("E")) + gamepad_button_check_pressed(0, gp_face3);
		almond_key = clamp(almond_key, 0, 1);
}


function save_game() {
	ini_open(global.save_file);

	ini_write_real("nuts", "cashew", global.cashew_collected);
	ini_write_real("nuts", "almond", global.almond_collected);
	ini_write_real("nuts", "chestnut", global.chestnut_collected);
	ini_write_real("nuts", "peanut", global.peanut_collected);
	ini_write_real("nuts", "millenniumnut", global.millennium_nut_collected);
	
	global.player_x_save = ini_write_real("player", "player_x", obj_player.x);
	global.player_y_save = ini_write_real("player", "player_y", obj_player.y);
	
	global.save_exists = ini_write_real("save", "exists", true);

	ini_write_string("player", "room", room_get_name(room));

	ini_close();
}