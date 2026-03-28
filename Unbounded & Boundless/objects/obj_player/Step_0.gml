if not global.talking_data.speech.talking{
	if place_meeting(x,y,obj_enemy_parent){
		moving = false
		x = safe.x
		y = safe.y
	}
	if movement() and not moving and flip == 8{
		moving = true
		if global.input_data.actions.held(global.input_data.keys.right){
			x_move = 1
			image_index = 0
		}
		else if  global.input_data.actions.held(global.input_data.keys.left){
			x_move = -1
			image_index = 1
		}
		else if global.input_data.actions.held(global.input_data.keys.down){
			y_move = 1
			image_index = 2
		}
		else if  global.input_data.actions.held(global.input_data.keys.up){
			y_move = -1
			image_index = 3
		}
	}
	if flip <= 7{
		flip += 1
	}
	if moving{
		if place_meeting(x,y,obj_ice){
			ice_move()
		}
		else{
			move()
		}
	}
	else{
		x_move = 0
		y_move = 0
	}
	if place_meeting(x,y,obj_walkable_border){
		with obj_walkable_border{
			image_index = 0
		}
	}
	else{
		with obj_walkable_border{
			image_index = 1
		}
	}
	if not global.save_data.bounded{
		collide = [obj_border,obj_collide,obj_enemy_unphased,obj_switch,obj_piston,obj_border_hole]
	}
	else{
		collide = [obj_border_parent,obj_collide,obj_enemy_unphased,obj_switch,obj_piston,obj_border_hole]
	}
	if phased{
		collide = [obj_border,obj_switch_phased,obj_collide,obj_enemy_phased,obj_border_hole]
	}
	if place_meeting(x,y,obj_border_parent){
		global.save_data.camera_bounded = false
	}

	if not global.save_data.bounded{
		with obj_player_bounded{
			instance_destroy(self)
		}
		camera_set_view_target(view_camera[0],self)
	}
}
if ((not moving) or (x == xprevious and y == yprevious)) and object_exists(obj_grid) and instance_nearest(x,y,obj_grid) != noone{
	x = instance_nearest(x-16,y-16,obj_grid).x+16
	y = instance_nearest(x-16,y-16,obj_grid).y+16
}
if place_meeting(x,y,obj_water) and not place_meeting(x,y,obj_box_float){
	layer = layer_get_id("Water_Player")
	if water_flip{
		breath = max_breath
		water_flip = false
	}
	if not moving and breath_flip{
		breath -= 1
		breath_flip = false
	}
	else if moving and not breath_flip{
		breath_flip = true
	}
	if breath == 0{
		x = safe.x
		y = safe.y
		dead = true
	}
}
else{
	breath = 0
	water_flip = true
	layer = layer_get_id("Player")
}
if place_meeting(x,y,obj_water) and place_meeting(x,y,obj_box_float){
	breath = 0
	water_flip = true
	layer = layer_get_id("Player")
}