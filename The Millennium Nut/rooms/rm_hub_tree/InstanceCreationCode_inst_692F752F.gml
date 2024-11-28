if(!global.cashew_collected || 
   !global.peanut_collected || 
   !global.almond_collected || 
   !global.chestnut_collected){
	   
	   layer_set_visible(layer_get_id("Tiles_Door"), false);
	   
	   instance_destroy();
}