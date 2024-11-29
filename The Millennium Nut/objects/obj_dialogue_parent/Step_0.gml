if(showing_dialogue == false) {
	if(dialog.count() <= 0) {
		instance_destroy();
		return;
	}
	
	curr_dialogue = dialog.pop();
	showing_dialogue = true;
}
else {
	if(keyboard_check_pressed(key_next) || gamepad_button_check_pressed(0, gp_face1) || 
	   gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(0, gp_face3) ||
	   gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(0, gp_padu) ||
	   gamepad_button_check_pressed(0, gp_padl) || gamepad_button_check_pressed(0, gp_padr) ||
	   gamepad_button_check_pressed(0, gp_padd)){
		showing_dialogue = false;
		alpha = 0;
	}
}