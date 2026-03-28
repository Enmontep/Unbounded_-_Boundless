image_speed = 0
move_speed = 4
moving = false
x_move = 0
y_move = 0
collide = noone
flip = 8
dead = false
death_time = 32
breath = 0
max_breath = 10
water_flip = true
breath_flip = false
phased = false
safe = {
	x:0,
	y:0
}
function move(){
	x+=x_move*move_speed
	y+=y_move*move_speed
	if (place_meeting(x,y,obj_box_parent) and not phased) or (place_meeting(x,y,obj_box_phased) and phased){
		push()
	}
	if (x+16) mod global.grid_size == 0 and (y+16) mod global.grid_size == 0{
		moving = false
		flip = 0
		if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent) and not phased{
			dead = true
		}
		if dead and not phased{
			x = safe.x
			y = safe.y
		}
	}
	else if place_meeting(x,y,collide){
		if not phased{
			if place_meeting(x,y,obj_switch){
				instance_place(x,y,obj_switch).active = not instance_place(x,y,obj_switch).active 
			}
		}
		else{
			if place_meeting(x,y,obj_switch_phased){
				instance_place(x,y,obj_switch_phased).active = not instance_place(x,y,obj_switch_phased).active 
			}
		}
		x-=x_move*move_speed
		y-=y_move*move_speed
		moving = false
		flip = 0
	}
}
function movement(){
	if global.input_data.actions.held(global.input_data.keys.left) or 
	global.input_data.actions.held(global.input_data.keys.right) or
	global.input_data.actions.held(global.input_data.keys.up) or
	global.input_data.actions.held(global.input_data.keys.down){
		return true
	}
	return false
}
function ice_move(){
	x+=x_move*move_speed
	y+=y_move*move_speed
	if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent){
		x-=x_move*global.grid_size
		y-=y_move*global.grid_size
		dead = true
	}
	else if place_meeting(x,y,obj_wire_path){
		var temp = instance_place(x,y,obj_wire_path)
		if temp.active{
			x-=x_move*global.grid_size
			y-=y_move*global.grid_size
			dead = true
		}
	}
	if place_meeting(x,y,collide) or place_meeting(x,y,obj_box_parent){
		moving = false
		flip = 0
		if place_meeting(x+(x_move*move_speed),y+(y_move*move_speed),obj_box_parent){
			var forward = 1
			while place_meeting(x+(x_move*global.grid_size*forward),y+(y_move*global.grid_size*forward),obj_box_parent){
				forward += 1
			}
			if not place_meeting(x+(x_move*global.grid_size*forward),y+(y_move*global.grid_size*forward),obj_border_parent){
				if not phased{
					push()
				}
			}
		}
		while place_meeting(x,y,collide) or place_meeting(x,y,obj_box_parent){
			if place_meeting(x,y,obj_switch){
				instance_place(x,y,obj_switch).active = not instance_place(x,y,obj_switch).active 
			}
			x-=x_move
			y-=y_move
			
		}
	}
	else if (place_meeting(x,y,obj_box_parent) and not phased) or (place_meeting(x,y,obj_box_phased) and phased) push()
}
x += x mod 32
y += y mod 32