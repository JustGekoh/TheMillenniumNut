// Textbox Parameters
textbox_width = 239;
textbox_height = 63;
border = 8;
line_sep = 12;
line_width  = textbox_width - border*9; // border *8 if u add the crest
txtb_spr = spr_dbox;
txtb_img = 0;
txtb_img_spd = 0;
ch_frame_spr = spr_character_frame;

//The text
page = 0;
page_number = 0;
text[0]= "Test line.";
text[1]= "Another test line.";
text[2]= "Short";
text[3]= "Long text Long text Long % {[()]} text ; : , . Long text * + = - _ ^ & ' Long text, Long text !!! Long text @ Long textLong textLong text.";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;
//the textbox appears over anything else
depth = -100000;