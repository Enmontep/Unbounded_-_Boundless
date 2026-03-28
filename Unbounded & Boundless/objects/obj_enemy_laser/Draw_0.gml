instance_deactivate_object(obj_box_phased)
ray = 0
if facing == 0{
	var sray = guide_draw(0,-1)
	if sray{
		if sray.id.object_index == obj_mirror{
			draw_line_width_colour(x,y,sray.x,sray.y-16,2,color,color)
			with sray.id{
				light = true
				color = other.color
				light_side = 1
				light_change()
			}
		}
		else if sray.id.object_index == obj_box_glass{
			with sray.id{
				light_face = 0
				color_change()
			}
		}
	}
	ray = sray
}
else if facing == 2{
	var sray = guide_draw(0,1)
	if sray{
		if sray.id.object_index == obj_mirror{
			draw_line_width_colour(x,y,sray.x,sray.y+16,2,color,color)
			with sray.id{
				light = true
				color = other.color
				light_side = 0
				light_change()
			}
		}
		else if sray.id.object_index == obj_box_glass{
			with sray.id{
				light_face = other.facing
				color_change()
			}
		}
	}
	ray = sray
}
else if facing == 1{
	var sray = guide_draw(-1,0)	
	if sray{
		if sray.id.object_index == obj_mirror{
			draw_line_width_colour(x,y,sray.x-16,sray.y,2,color,color)
			with sray.id{
				light = true
				color = other.color
				light_side = 3
				light_change()
			}
		}
		else if sray.id.object_index == obj_box_glass{
			with sray.id{
				light_face = other.facing
				color_change()
			}
		}
	}
	ray = sray
}
else if facing == 3{
	var sray = guide_draw(1,0)	
	if sray{
		if sray.id.object_index == obj_mirror{
			draw_line_width_colour(x,y,sray.x+16,sray.y,2,color,color)
			with sray.id{
				light = true
				color = other.color
				light_side = 2
				light_change()
			}
		}
		else if sray.id.object_index == obj_box_glass{
			with sray.id{
				light_face = other.facing
				color_change()
			}
		}
	}
	ray = sray
}
with obj_port{
	if other.ray{
		if id == other.ray.id and color = other.color{
			active = true
		}
	}
}
draw_self()
instance_activate_object(obj_box_phased)