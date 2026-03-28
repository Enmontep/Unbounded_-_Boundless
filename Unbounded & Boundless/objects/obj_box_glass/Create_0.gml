// Inherit the parent event
event_inherited();
image_speed = 0 
color = c_red
color_flip = true
colors = [c_red,c_green,c_blue]
light_face = 0
ray = 0
ray_collide = [obj_border,obj_walkable_border,obj_false_border,obj_collide,obj_switch,obj_box_parent,obj_enemy_unphased,obj_player]
function color_change(){
	ray = 0
	instance_deactivate_object(obj_box_phased)
	if light_face == 0{
		var sray = guide_draw(0,-1)
		if sray{
			if sray.id.object_index == obj_mirror{
				draw_line_width_colour(x+16,y,sray.x,sray.y-16,2,color,color)
				with sray.id{
					light = true
					color = other.color
					light_side = 1
					light_change()
				}
			}
		}
		ray = sray
	}
	else if light_face == 1{
		var sray = guide_draw(0,1)
		if sray{
			if sray.id.object_index == obj_mirror{
				draw_line_width_colour(x-16,y,sray.x,sray.y+16,2,color,color)
				with sray.id{
					light = true
					color = other.color
					light_side = 0
					light_change()
				}
			}
		}
		ray = sray
	}
	else if light_face == 2{
		var sray = guide_draw(-1,0)	
		if sray{
			if sray.id.object_index == obj_mirror{
				draw_line_width_colour(x,y-16,sray.x-16,sray.y,2,color,color)
				with sray.id{
					light = true
					color = other.color
					light_side = 3
					light_change()
				}
			}
		}
		ray = sray
	}
	else if light_face == 3{
		var sray = guide_draw(1,0)	
		if sray{
			if sray.id.object_index == obj_mirror{
				draw_line_width_colour(x,y+16,sray.x+16,sray.y,2,color,color)
				with sray.id{
					light = true
					color = other.color
					light_side = 2
					light_change()
				}
			}
		}
		ray = sray
	}
	draw_self()
	with obj_port{
		if other.ray{
			if id == other.ray.id and color = other.color{
				active = true
			}
		}
	}
	instance_activate_object(obj_box_phased)
}
function guide_draw(xmult,ymult){
	var sray = raycast(x+16,y+16,xmult,ymult,(room_width*4*xmult)+16,(room_height*4*ymult)+16,ray_collide)
	if sray{
		draw_line_width_colour(x+16,y+16,sray.x,sray.y,2,color,color)
	}
	else{
		draw_line_width_colour(x+16,y+16,x+(room_width*4*xmult)+16,y+(room_height*4*ymult)+16,2,color,color)
	}
	return sray
}