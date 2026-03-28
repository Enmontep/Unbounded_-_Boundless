active_checks = 0
with obj_active{
	if object_index != obj_wire_path and active_id == other.active_id{
		other.active = active
		other.can_active = true
	}
}
if place_meeting(x,y,obj_wire_path) and can_active{
	instance_place(x,y,obj_wire_path).active = active
}
if active{
	for (var i = 0; i < array_length(instances); i += 1){
		if instances[i].player_in{
			obj_player.dead = true
		}
	}
}
if place_meeting(x+global.grid_size,y,obj_box_wired){
	if instance_place(x+global.grid_size,y,obj_box_wired).active{
		active_checks += 1
	}
}
if place_meeting(x-global.grid_size,y,obj_box_wired){
	if instance_place(x-global.grid_size,y,obj_box_wired).active{
		active_checks += 1
	}
}
if place_meeting(x,y+global.grid_size,obj_box_wired){
	if instance_place(x,y+global.grid_size,obj_box_wired).active{
		active_checks += 1
	}
}
if place_meeting(x,y-global.grid_size,obj_box_wired){
	if instance_place(x,y-global.grid_size,obj_box_wired).active{
		active_checks += 1
	}
}
with obj_active{
	if object_index != obj_wire_path and active_id == other.active_id and active{
		other.active_checks += 1
	}
}
if active_checks == 0{
	with obj_wire_path{
		if active_id == other.active_id{
			var checks = 0
			if place_meeting(x+global.grid_size,y,obj_box_wired){
				if instance_place(x+global.grid_size,y,obj_box_wired).active{
					checks += 1
				}
			}
			if place_meeting(x-global.grid_size,y,obj_box_wired){
				if instance_place(x-global.grid_size,y,obj_box_wired).active{
					checks += 1
				}
			}
			if place_meeting(x,y+global.grid_size,obj_box_wired){
				if instance_place(x,y+global.grid_size,obj_box_wired).active{
					checks += 1
				}
			}
			if place_meeting(x,y-global.grid_size,obj_box_wired){
				if instance_place(x,y-global.grid_size,obj_box_wired).active{
					checks += 1
				}
			}
			if checks == 0{
				active = false
				other.active = false
				color = c_dkgray
				other.color = c_dkgray
			}
			else{
				active = true
				other.active = true
				color = c_yellow
				other.color = c_yellow
			}
		}
	}
}