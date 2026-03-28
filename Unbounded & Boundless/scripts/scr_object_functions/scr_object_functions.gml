function player_moved(){
	with obj_player{
		if (y != yprevious or x != xprevious) and not moving{
			return true
		}
		return false
	}
}
function player_in_wall(){
	with obj_player{
		if place_meeting(x,y,obj_walkable_border){
			return true
		}
		return false
	}
}
function make_action_prompt(words,mult=1,act_layer="Instances"){
	instance_create_layer(room_width/2,0,act_layer,obj_action_prompt,{pop_title:words,count_mult:mult})
}
function make_text_spawner(words,text_speed){
	instance_create_layer(global.talking_data.spawner.x,global.talking_data.spawner.y,"UI",obj_talking_text_spawner,{text:words,scroll_speed:text_speed})
}
function grid_fill(object = object_index,grid_layer = layer_get_name(layer),destroy = true){
	if image_xscale != 1 or image_yscale != 1{
		var instances = []
		for (var i = 0; i < image_xscale; i += 1){
			for (var k = 0; k < image_yscale; k += 1){
				var temp_id = instance_create_layer(x+(i*global.grid_size),y+(k*global.grid_size),grid_layer,object)
				array_push(instances,temp_id)
			}
		}
		if destroy{
			instance_destroy(self)
		}
		else{
			return instances
		}
	}
}
function push(){
	var units = 1
	var boxes = []
	while place_meeting(x+(x_move*global.grid_size*units),y+(y_move*global.grid_size*units),obj_box_parent){
		var box = instance_place(x+(x_move*global.grid_size*units),y+(y_move*global.grid_size*units),obj_box_parent)
		if not (box.fell and box.moving) or (place_meeting(box.x,box.y,obj_gap) and not place_meeting(x,y,obj_box_parent)) and box != -4{
			array_insert(boxes,units-1,box)
			units += 1
			
		}
		else{
			break
		}
	}
	if not place_meeting(x+(x_move*global.grid_size*(units)-(x_move*global.grid_size/2)),y+(y_move*global.grid_size*(units)-(y_move*global.grid_size/2)),[obj_collide,obj_border_parent,obj_enemy_parent]){
		for (var i = 0; i < array_length(boxes); i +=1){
			var box = boxes[i]
			box.x_move = x_move
			box.y_move = y_move
			box.moving = true
		}
	}
	else if x_move > 0{
		if place_meeting(x+(global.grid_size),y,[obj_collide,obj_border_parent,obj_enemy_parent]) and not place_meeting(x+2,y,[obj_collide,obj_border_parent,obj_enemy_parent]){
			for (var i = 0; i < array_length(boxes); i +=1){
				var box = boxes[i]
				box.x_move = x_move
				box.y_move = y_move
				box.moving = true
			}
		}
	}
	else if y_move > 0{
		if place_meeting(x,y+(global.grid_size),[obj_collide,obj_border_parent,obj_enemy_parent]) and not place_meeting(x,y+2	,[obj_collide,obj_border_parent,obj_enemy_parent]){
			for (var i = 0; i < array_length(boxes); i +=1){
				var box = boxes[i]
				box.x_move = x_move
				box.y_move = y_move
				box.moving = true
			}
		}
	}
	else{
		x-=x_move*move_speed
		y-=y_move*move_speed
		moving = false
		flip = 0
	}
}
function instance_deactivate_array(items){
	if is_array(items){
		for (var i = 0; i < array_length(items); ++i) {
		    instance_deactivate_object(items[i])
		}
	}
	else{
		instance_deactivate_object(items)
	}
}
function instance_activate_array(items){
	if is_array(items){
		for (var i = 0; i < array_length(items); ++i) {
		    instance_activate_object(items[i])
		}
	}
	else{
		instance_activate_object(items)
	}
}
function raycast(startx,starty,xdist,ydist,xdistmax,ydistmax,objects){
	var checkx = startx
	var checky = starty
	while not (checkx == startx+xdistmax and checky == starty+ydistmax){
		if position_meeting(checkx,checky,objects) and instance_position(checkx,checky,objects).id != self.id{
			return {x : checkx, y : checky, id : instance_position(checkx,checky,objects)}
		}
		else{
			if checkx != startx+xdistmax{
				checkx += xdist
			}
			if checky != starty+ydistmax{
				checky += ydist
			}
		}
	}
	return false
}