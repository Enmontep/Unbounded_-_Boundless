if active{
	color = c_yellow
}
else{
	color = c_dkgray
}
if place_meeting(x+global.grid_size,y,[obj_wire_path,obj_active]){
	temp = instance_place(x+global.grid_size,y,[obj_wire_path,obj_active])
	draw_line_width_colour(x+16,y+16,temp.x+16,temp.y+16,2,color,color)
}
if place_meeting(x-global.grid_size,y,[obj_wire_path,obj_active]){
	temp = instance_place(x-global.grid_size,y,[obj_wire_path,obj_active])
	draw_line_width_colour(x+16,y+16,temp.x+16,temp.y+16,2,color,color)
}
if place_meeting(x,y+global.grid_size,[obj_wire_path,obj_active]){
	temp = instance_place(x,y+global.grid_size,[obj_wire_path,obj_active])
	draw_line_width_colour(x+16,y+16,temp.x+16,temp.y+16,2,color,color)
}
if place_meeting(x,y-global.grid_size,[obj_wire_path,obj_active]){
	temp = instance_place(x,y-global.grid_size,[obj_wire_path,obj_active])
	draw_line_width_colour(x+16,y+16,temp.x+16,temp.y+16,2,color,color)
}
if not place_meeting(x,y,obj_border){
	 draw_self()
}