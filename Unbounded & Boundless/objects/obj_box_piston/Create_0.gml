// Inherit the parent event
event_inherited();
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
image_speed = 0
pushable = [obj_box_parent,obj_enemy_unphased]
pushed = noone
pushing = false
push_speed = 4
push_length = 4
can_push = true
pushed_start = {
	x : 0,
	y : 0
}
ray_collide = [obj_border,obj_collide,obj_switch,obj_box_parent,obj_enemy_unphased,obj_player]
c_brown = make_colour_rgb(127,65,11)
function guide_draw(xmult,ymult){
	//x-(16*ymult),y-(16*xmult)
	var sray = raycast(x-(16*ymult),y+(16*xmult),xmult,ymult,(global.grid_size*4*xmult),(global.grid_size*4*ymult),ray_collide)
	if sray{
		draw_line_width_colour(x-(16*ymult),y+(16*xmult),sray.x,sray.y,2,c_brown,c_brown)
	}
	else{
		var lray = raycast(x-(16*ymult),y+(16*xmult),xmult,ymult,(global.grid_size*9*xmult),(global.grid_size*9*ymult),ray_collide)
		if lray{
			draw_line_width_colour(x-(16*ymult),y+(16*xmult),lray.x,lray.y,2,c_white,c_white)
		}
		else{
			draw_line_width_colour(x-(16*ymult),y+(16*xmult),x+(global.grid_size*9*xmult)-(16*ymult),y+(global.grid_size*9*ymult)+(16*xmult),2,c_white,c_white)
		}
		draw_line_width_colour(x-(16*ymult),y+(16*xmult),x+(global.grid_size*4*xmult)-(16*ymult),y+(global.grid_size*4*ymult)+(16*xmult),2,c_brown,c_brown)
	}
}