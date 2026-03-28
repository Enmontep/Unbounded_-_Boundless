// Inherit the parent event
event_inherited();
color = c_red
color_flip = true
colors = [c_red,c_green,c_blue]
ray_collide = [obj_border,obj_walkable_border,obj_false_border,obj_collide,obj_switch,obj_box_parent,obj_enemy_unphased,obj_player]
image_speed = 0
if image_angle == 0 or abs(image_angle) == 360{
	facing = 0
}
else if abs(image_angle) == 180{
	facing = 1
}
if image_angle == 90 or image_angle == -270{
	facing = 2
}
else if image_angle == 270 or image_angle == -90{
	facing = 3
}
else{
	facing = 0
}
lighting = noone
function guide_draw(xmult,ymult){
	var sray = raycast(x-(16*ymult),y+(16*xmult),xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
	if sray{
		draw_line_width_colour(x-(16*ymult),y+(16*xmult),sray.x,sray.y,2,color,color)
	}
	else{
		draw_line_width_colour(x-(16*ymult),y+(16*xmult),x+(room_width*4*xmult)-(16*ymult),y+(room_height*4*ymult)+(16*xmult),2,color,color)
	}
	return sray
}
ray = 0