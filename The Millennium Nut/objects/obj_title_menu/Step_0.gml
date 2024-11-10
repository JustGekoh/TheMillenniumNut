//Getting Inputs
up_key = keyboard_check_pressed(vk_up) + gamepad_button_check_pressed(0,gp_padu);
up_key = clamp(up_key, 0, 1);

down_key = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0,gp_padd);
down_key = clamp(down_key, 0, 1);

accept_key = keyboard_check_pressed(vk_enter)+ gamepad_button_check_pressed(0,gp_face1);
accept_key = clamp(accept_key, 0, 1);

//Store number of options in current menu
op_length = array_length(option[menu_level]);


//Move Through the menu
menu_pos =menu_pos+ (down_key - up_key);

if(menu_pos >= op_length){
	menu_pos = 0;
}
if(menu_pos < 0){
	menu_pos =op_length-1;
}

//Using the options
if(accept_key){
	var sm_level = menu_level;
	switch(menu_level){
		//Pause Menu
		case 0:
			switch(menu_pos){
				case 0: //New Game
					delete_save(); load_game(); room_goto(rm_init); break;
				case 1: //Continue
					load_game(); room_goto(rm_init); break;
				case 2: //Settings
					menu_level = 1; break;
				case 3: //Quit Game
					game_end();	break;
			}
			break;
		//Settings menu
		case 1 :
			switch(menu_pos){
				case 0: //Window Settings
					menu_level = 2;
					break;
				case 1: //Audio
					break;
				case 2: //Controls
					break;
				case 3: //Back
					menu_level = 0;
					break;
			}
			break;
		//Window Settings
		case 2:
			switch(menu_pos){
				case 0: //Fullscreen
					window_set_fullscreen(true);
					break;
				case 1: // Windowed
					window_set_fullscreen(false);
					break;
				case 2:
					menu_level = 1;
					break;
			}
			break;
			
			
	}
		
	//set position back
	if(sm_level != menu_level){
		menu_pos = 0;
	}
	
	//Correct Option Length
	op_length = array_length(option[menu_level]);
}