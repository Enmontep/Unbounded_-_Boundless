move_speed = 4
moving = false
x_move = 0
y_move = 0
last = noone
facing = 0
collide = [obj_collide,obj_border_parent,obj_player,obj_border_hole]
flip = 32
x -= 16
y -= 16
function move(){
	x+=x_move*move_speed
	y+=y_move*move_speed
	if object_index == obj_enemy_phased{
		if place_meeting(x,y,obj_box_phased) push()
	}
	else{
		instance_deactivate_object(obj_box_phased)
		if place_meeting(x,y,obj_box_parent) push()
		instance_activate_object(obj_box_phased)
	}
	if (x+16) mod global.grid_size == 0 and (y+16) mod global.grid_size == 0{
		moving = false
		flip = 0
		if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent){
			x-=x_move*global.grid_size
			y-=y_move*global.grid_size
			dead = true
		}
	}
	else if place_meeting(x,y,collide){
		x-=x_move*move_speed
		y-=y_move*move_speed
		moving = false
		flip = 0
	}
}
function up(){
	if place_meeting(x,y-global.grid_size,obj_enemy_path){
		if instance_place(x,y-global.grid_size,obj_enemy_path) != last{
			facing = 0
			y_move = -1
			x_move = 0
			image_angle = 0
			last = instance_place(x,y-global.grid_size,obj_enemy_path)
			return true
		}
	}
	return false
}
function left(){
	if place_meeting(x-global.grid_size,y,obj_enemy_path){
		if instance_place(x-global.grid_size,y,obj_enemy_path) != last{
			facing = 1
			y_move = 0
			x_move = -1
			image_angle = 90
			last = instance_place(x-global.grid_size,y,obj_enemy_path)
			return true
		}
	}
	return false
}
function down(){
	if place_meeting(x,y+global.grid_size,obj_enemy_path){
		if instance_place(x,y+global.grid_size,obj_enemy_path) != last{	
			facing = 2
			y_move = 1
			x_move = 0
			image_angle = 180
			last = instance_place(x,y+global.grid_size,obj_enemy_path)
			return true
		}
	}
	return false
}
function right(){
	if place_meeting(x+global.grid_size,y,obj_enemy_path){
		if instance_place(x+global.grid_size,y,obj_enemy_path) != last{
			facing = 3
			y_move = 0
			x_move = 1
			image_angle = 270
			last = instance_place(x+global.grid_size,y,obj_enemy_path)
			return true
		}
	}
	return false
}
function check_up(){
	if not up(){
		if not left(){
			if not right(){
				down()
			}
		}
	}
}
function check_left(){
	if not left(){
		if not down(){
			if not up(){
				right()
			}
		}
	}
}
function check_down(){
	if not down(){
		if not right(){
			if not left(){
				up()
			}
		}
	}
}
function check_right(){
	if not right(){
		if not up(){
			if not down(){
				left()
			}
		}
	}
}
function ice_move(){
	x+=x_move*move_speed
	y+=y_move*move_speed
	if object_index == obj_enemy_phased{
		if place_meeting(x,y,obj_box_phased) push()
	}
	else{
		instance_deactivate_object(obj_box_phased)
		if place_meeting(x,y,obj_box_parent) push()
		instance_activate_object(obj_box_phased)
	}
	if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent){
		x-=x_move*global.grid_size
		y-=y_move*global.grid_size
		dead = true
	}
	else if place_meeting(x,y,collide) or place_meeting(x,y,obj_box_parent){
		x-=x_move*move_speed
		y-=y_move*move_speed
		moving = false
		flip = 0
		if place_meeting(x+(x_move*move_speed),y+(y_move*move_speed),obj_box_parent){
			var forward = 1
			while place_meeting(x+(x_move*global.grid_size*forward),y+(y_move*global.grid_size*forward),obj_box_parent){
				forward += 1
			}
			if not place_meeting(x+(x_move*global.grid_size*forward),y+(y_move*global.grid_size*forward),obj_border_parent){
				push()
			}
		}
	}
}
true_flip = true