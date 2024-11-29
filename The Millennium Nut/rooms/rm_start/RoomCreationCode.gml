if(global.show_intro_dialogue) {

	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text: ["Ever since you were a pup, your squirrel mom told you tales of The Millennium Nut.", 
		       "It is said that if someone were to plant this nut, it would instantly create enough food for generations.",
			   "Today, you have set out to find it."
			  ]	
	});	
	
	global.show_intro_dialogue = false;
}
