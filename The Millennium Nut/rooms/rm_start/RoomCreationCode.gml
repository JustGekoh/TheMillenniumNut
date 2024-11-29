if(global.show_intro_dialogue) {

	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text: ["Every since you were a pup, your family told tales of The Millennium Nut.", 
		       "It is said that if someone were to plant this nut, it would instantly create enough food for generations.",
			   "Today, you have set out to find it."
			  ]	
	});	
	
	global.show_intro_dialogue = false;
}
