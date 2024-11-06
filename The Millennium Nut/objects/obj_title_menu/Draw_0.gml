//draw font
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//Dynamic W&H
var new_width=0;
for(var i = 0; i<op_length; i++){
		var option_width = string_width(option[menu_level,i]);
		new_width = max(new_width, option_width);
}
menu_width = new_width + op_border*2;
menu_height = op_border*2 +string_height(option[0, 0]) + (op_length - 1)* op_space;

//Centering the menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - menu_width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - menu_height/2;

//BG
draw_sprite_ext(sprite_index, image_index, x,y, menu_width/sprite_width, menu_height/sprite_height,0, c_white, 1);

//option loop
for(var i = 0; i<op_length; i++){
	var c = c_white;
	if(menu_pos == i){
		c = c_yellow;
	}
	draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], c, c, c, c, 1);
}

