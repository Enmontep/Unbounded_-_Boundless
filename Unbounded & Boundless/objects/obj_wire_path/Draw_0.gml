if wired{
	with obj_active{
		if active_id == other.active_id{
			if not (active or other.active){
				draw_line_width_colour(x+16,y+16,other.x+16,other.y+16,2,c_dkgray,c_dkgray)
			}
			else{
				draw_line_width_colour(x+16,y+16,other.x+16,other.y+16,2,c_yellow,c_yellow)
			}
		}
	}
}
draw_self()