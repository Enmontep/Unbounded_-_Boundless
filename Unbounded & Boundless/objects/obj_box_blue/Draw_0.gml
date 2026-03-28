if not instance_exists(other_id){
	instance_create_layer(x,y,"Instances",obj_box_quantum)
	instance_destroy(self)
}
else{
	draw_line_width_colour(x+16,y+16,other_id.x+16,other_id.y+16,2,c_blue,c_red)
	draw_self()
	with other_id{
		draw_self()
	}
}