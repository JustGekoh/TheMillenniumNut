instance_create_depth(0, 0, -1000, obj_dialogue_child, {
	has_border : false,
	size : "match_parent",
	text_align : "center",
	text: ["THE END\n\nGame created for the 2024 November Nut Fest and Game Off game jams",
	       "Programming\n\nJust Gekoh\nAiForgorName",
		   "Sprites and Animation\n\nAiForgorName",
		   "Sound effects and music\n\nDeeaeu_Bagumi",
		   "Thank you for playing!"]
});	
	
if(instance_exists(obj_player)) {
	instance_destroy(obj_player);
}

if(instance_exists(obj_healthbar)) {
	instance_destroy(obj_healthbar);
}