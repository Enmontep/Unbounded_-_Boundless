// Inherit the parent event
event_inherited();

function guide_draw(xmult,ymult){
	var sray = raycast(x,y,xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
	if sray{
		draw_line_width_colour(x,y,sray.x,sray.y,2,color,color)
	}
	else{
		draw_line_width_colour(x,y,x+(room_width*4*xmult),y+(room_height*4*ymult),2,color,color)
	}
	return sray
}
ray_collide = [obj_border,obj_collide,obj_switch,obj_box_parent,obj_enemy_unphased,obj_player]
color = c_red
color_flip = true
colors = [c_red,c_green,c_blue]
ray = 0
image_speed = 0