if image_angle == 0{
	facing = 0
}
else if image_angle == 180{
	facing = 1
}
if image_angle == 90{
	facing = 2
}
else if image_angle == 270{
	facing = 3
}
can_push = true
if not pushing{
	push_length = 4
	if facing == 0{
		instance_deactivate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_deactivate_object(obj_player)
		}
		if place_meeting(x,y-2,pushable){
			pushed = instance_place(x,y-2,pushable)
			if not pushed.moving{
				image_speed = 1
				pushing = true
				pushed_start.x = pushed.x
				pushed_start.y = pushed.y
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
				pushed.y -= push_speed
			}
		}
		instance_activate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_activate_object(obj_player)
		}
	}
	else if facing == 1{
		instance_deactivate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_deactivate_object(obj_player)
		}
		if place_meeting(x,y+2,pushable){
			pushed = instance_place(x,y+2,pushable)
			if not pushed.moving{
				image_speed = 1
				pushing = true
				pushed_start.x = pushed.x
				pushed_start.y = pushed.y
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
				pushed.y += push_speed
			}
		}
		instance_activate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_activate_object(obj_player)
		}
	}
	else if facing == 2{
		instance_deactivate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_deactivate_object(obj_player)
		}
		if place_meeting(x-2,y,pushable){
			pushed = instance_place(x-2,y,pushable)
			if not pushed.moving{
				image_speed = 1
				pushing = true
				pushed_start.x = pushed.x
				pushed_start.y = pushed.y
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
				pushed.x -= push_speed
			}
		}
		instance_activate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_activate_object(obj_player)
		}
	}
	else if facing == 3{
		instance_deactivate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_deactivate_object(obj_player)
		}
		if place_meeting(x+2,y,pushable){
			pushed = instance_place(x+2,y,pushable)
			if not pushed.moving{
				image_speed = 1
				pushing = true
				pushed_start.x = pushed.x
				pushed_start.y = pushed.y
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
				pushed.x += push_speed
			}
		}
		instance_activate_array([obj_box_phased,obj_enemy_phased])
		if obj_player.phased{
			instance_activate_object(obj_player)
		}
	}
}
else{
	if (pushed.object_index == obj_box_light) or (pushed.object_index == obj_enemy_light){
		push_length = 9
	}
	if facing == 0{
		with pushed{
			instance_deactivate_object(obj_box_phased)
			if (place_meeting(x,y-other.push_speed,[obj_box_parent,obj_player]) or (place_meeting(x,y-other.push_speed,collide))){
				other.can_push = false
				
			}
			instance_activate_object(obj_box_phased)
		}
			if can_push{
				if pushed.y != pushed_start.y-(global.grid_size*push_length){
				pushed.x = pushed_start.x
				pushed.y -= push_speed
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
			}
			else{
				pushing = false
				pushed.moving = false
				pushed.x_move = 0
				pushed.y_move = 0
				pushed = noone
			}
		}
	}
	else if facing == 1{
		with pushed{
			instance_deactivate_object(obj_box_phased)
			if (place_meeting(x,y+other.push_speed,[obj_box_parent,obj_player]) or (place_meeting(x,y+other.push_speed,collide))){
				other.can_push = false
				
			}
			instance_activate_object(obj_box_phased)
		}
			if can_push{
				if pushed.y != pushed_start.y+(global.grid_size*push_length){
				pushed.x = pushed_start.x
				pushed.y += push_speed
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
			}
				else{
				pushing = false
				pushed.moving = false
				pushed.x_move = 0
				pushed.y_move = 0
				pushed = noone
			}
		}
	}
	else if facing == 2{
		with pushed{
			instance_deactivate_object(obj_box_phased)
			if (place_meeting(x-other.push_length,y,[obj_box_parent,obj_player]) or (place_meeting(x-other.push_speed,y,collide))){
				other.can_push = false
				
			}
			instance_activate_object(obj_box_phased)
		}
		if can_push{
			if pushed.x != pushed_start.x-(global.grid_size*push_length){
				pushed.y = pushed_start.y
				pushed.x -= push_speed
				pushed.moving = true
				pushed.x_move = 0
				pushed.y_move = 0
			}
				else{
					pushing = false
					pushed.moving = false
					pushed.x_move = 0
					pushed.y_move = 0
					pushed = noone
			}
		}
	}
	else if facing == 3{
		with pushed{
			instance_deactivate_object(obj_box_phased)
			if (place_meeting(x+other.push_speed,y,[obj_box_parent,obj_player]) or (place_meeting(x+other.push_speed,y,collide) and not place_meeting(x+other.push_speed,y,obj_piston))){
				other.can_push = false
				
			}
			instance_activate_object(obj_box_phased)
		}
		if can_push{
			if pushed.x < pushed_start.x+(global.grid_size*push_length){
			pushed.y = pushed_start.y
			pushed.x += push_speed
			pushed.moving = true
			pushed.x_move = 0
			pushed.y_move = 0
		}
			else{
				pushing = false
				pushed.moving = false
				pushed.x_move = 0
				pushed.y_move = 0
				pushed = noone
		}
		}
		else{
			pushing = false
			pushed = noone
		}
	}
}
if image_index+1 == image_number{
	image_speed = 0
	image_index = 0
}
if not can_push and pushed != noone{
		pushing = false
		pushed.moving = false
		pushed.x_move = 0
		pushed.y_move = 0
		pushed = noone
	}