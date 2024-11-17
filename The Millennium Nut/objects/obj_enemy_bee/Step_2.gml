image_angle = point_direction(xprevious, yprevious, x, y);
if(image_angle > 90 && image_angle < 270){
	image_yscale = -1;	
}
else {
	image_yscale = 1;	
}