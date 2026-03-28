with obj_door{
	if not (place_meeting(x+global.grid_size,y,obj_wire_path) or
place_meeting(x-global.grid_size,y,obj_wire_path) or
place_meeting(x,y+global.grid_size,obj_wire_path) or
place_meeting(x,y-global.grid_size,obj_wire_path) or
place_meeting(x,y,obj_wire_path)){	
		if active_id == other.active_id{
			if image_angle == 180{
				draw_line_width_colour(x,y-16,other.x,other.y,2,c_maroon,c_maroon)
			}
			else if image_angle == 0{
				draw_line_width_colour(x,y+16,other.x,other.y,2,c_maroon,c_maroon)
			}
			else if image_angle == 90{
				draw_line_width_colour(x+16,y,other.x,other.y,2,c_maroon,c_maroon)
			}
			else{
				draw_line_width_colour(x-16,y,other.x,other.y,2,c_maroon,c_maroon)
			}
		}
	}
}
draw_self()