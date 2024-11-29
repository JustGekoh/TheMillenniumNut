instance_create_depth(0, 0, -1000, obj_dialogue_child, {
	has_border : false,
	size : "match_parent",
	text_align : "center",
	text: ["THE END\n\nGame created for the 2024 November Nut Fest game jam",
	       "Programming\n\nJustGekoh\nAiforgorName / AiForgorName / AifurGorName",
		   "Sprites and Animation\n\nAiforgorName / AiForgorName / AifurGorName",
		   "Sound effects and music\n\ndeeau_2nd",
		   "Thank you for playing!"]
});	
	
if(instance_exists(obj_player)) {
	instance_destroy(obj_player);
}

if(instance_exists(obj_healthbar)) {
	instance_destroy(obj_healthbar);
}