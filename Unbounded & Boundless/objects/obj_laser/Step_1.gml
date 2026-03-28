if x_move == 1 and image_angle != 270{
	image_angle = 270
	x = obj_player.x+16+32
	y = obj_player.y-16
}
else if x_move == -1 and image_angle != 90{
	image_angle = 90
	x = obj_player.x-16-32
	y = obj_player.y+16
}	
else if y_move == 1 and image_angle != 180{
	image_angle = 180
	x = obj_player.x+16
	y = obj_player.y+16+32
}
else if y_move == -1 and image_angle != 0{
	image_angle = 0	
	x = obj_player.x-16
	y = obj_player.y-16-32
}