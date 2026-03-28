if object_index == obj_box_phased and place_meeting(x,y,obj_enemy_phased){
	move()
}
else if place_meeting(x,y,obj_enemy_unphased){
	move()
}
if object_index == obj_box_phased{
	push_check = not obj_player.phased
}
else if instance_exists(obj_player){
	push_check = obj_player.phased
}
if place_meeting(x,y,obj_water){
	wet = true
}
if place_meeting(x,y,obj_water) and object_index == obj_box_float and (not moving) and (not place_meeting(x,y,obj_box_float)){
	float_wet = true
	wet_x = x
	wet_y = y
}
if float_wet{
	x = wet_x
	y = wet_y
}
if moving and not fell{
	if flip{
		safe_x = x
		safe_y = y
		flip = false
	}
	if place_meeting(x+(x_move*4),y+(y_move*4),obj_ice){
		if object_index == obj_box_heavy{
			move()
		}
		else{
			ice_move()
		}	
	}
	else if place_meeting(x,y,obj_player) and not push_check{
		move()
	}
}
else if (fell or (place_meeting(x,y,obj_gap) and not moving)) and not (object_index == obj_box_phased){
	var sprite = sprite_index
	if not array_contains([obj_box_red,obj_box_blue],object_index){
		instance_destroy(instance_place(x,y,obj_gap))
		instance_create_layer(x,y,"Instances",obj_fell_box,{sprite_index:sprite})
	}
	instance_destroy(self)
}
else{
	if place_meeting(x,y,[obj_collide,obj_border]){
		x = safe_x
		y = safe_y
	}
	flip = true
	x_move = 0
	y_move = 0
}
if place_meeting(x,y,[obj_player,obj_box_parent]) and moving and push_check{
	x_move = 0
	y_move = 0
	moving = false
		
}
if place_meeting(x,y,[obj_player,obj_box_parent]) and moving and not push_check{
	x_move = obj_player.x_move
	y_move = obj_player.y_move
	move()
}
else if place_meeting(x,y,obj_player) and not push_check{
	x += obj_player.x_move*global.grid_size
	y += obj_player.y_move*global.grid_size
	obj_player.moving = false
}
if ((not moving) or (x == xprevious and y == yprevious)) and object_exists(obj_grid) and instance_nearest(x,y,obj_grid) != noone{
	x = instance_nearest(x,y,obj_grid).x
	y = instance_nearest(x,y,obj_grid).y
}
if float_wet{
	x = wet_x
	y = wet_y
}
if x == xprevious and y == yprevious{
	moving = false
}
if x_move != 0{
	checkx = x_move
	checky = 0
}
else if y_move != 0{
	checky = y_move
	checkx = 0
}
instance_deactivate_object(obj_box_phased)
if place_meeting(x,y,obj_box_parent) and not moving{
	if not place_meeting(x,y-global.grid_size,collide){
		y -= global.grid_size
	}
	else if not place_meeting(x+global.grid_size,y,collide){
		x += global.grid_size
	}
	else if not place_meeting(x,y+global.grid_size,collide){
		y += global.grid_size
	}
	else if not place_meeting(x-global.grid_size,y,collide){
		x -= global.grid_size
	}
}
instance_activate_object(obj_box_phased)