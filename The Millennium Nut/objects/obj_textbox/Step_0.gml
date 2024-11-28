/// @description Insert description here
// You can write your code in this editor
accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]) - 15;
textbox_y = camera_get_view_y(view_camera[0]) + 127;

//---------------------setup---------------------------//
if(setup ==false){
setup = true;
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


//Loop through the pages
page_number = array_length(text);
for(var p = 0; p <page_number ;p++){
//find the nr of char on each page and stor them in text_length
text_length[p] = string_length(text[p]);

//Get the x position for the textbox
//Center( no character speaking )
text_x_offset[p] = 31;
}
}

//----------------typing the text----------------------//
if(draw_char < text_length[page]){
draw_char += text_spd;
draw_char = clamp(draw_char, 0, text_length[page]);
}
//---------------flip through pages--------------------//
if(accept_key){
//if the typing is done
if(draw_char == text_length[page]){
//next page
if(page <page_number -1){
page++;
draw_char = 0;
}else{ //destroy the textbox if there are no more pages
instance_destroy();
}

}else{ //if not done typing
draw_char = text_length[page];
}
}
//----------------draw the textbox---------------------//
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);


//--------------back of the textbox--------------------//
draw_sprite_ext(txtb_spr, txtb_img ,textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);
draw_sprite_ext(spr_character_frame,image_index, textbox_x + text_x_offset[page]+176, textbox_y -32 , 2.6,2.7, 0 ,c_white, 1);
//-----------------draw the text----------------------//
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);