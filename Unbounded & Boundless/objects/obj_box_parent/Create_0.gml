move_speed = 4
moving = false
x_move = 0
y_move = 0
collide = [obj_border,obj_collide,obj_switch,obj_border_hole]
fell = false
safe_x = x
safe_y = y
wet = false
wet_x = 0
wet_y = 0
float_wet = false
flip = true
float_on = false
push_check = false
checkx = 0
checky = 0
if instance_exists(obj_player) push_check = obj_player.phased
function move(){
	moving = true
	x+=x_move*move_speed
	y+=y_move*move_speed
	if (x) mod global.grid_size == 0 and (y) mod global.grid_size == 0{
		moving = false
		if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent) and not object_index == obj_box_phased{
			fell = true
		}
	}
	else if place_meeting(x,y,collide) or (object_index != obj_box_float and (wet and ( not place_meeting(x+(global.grid_size*x_move),y+(global.grid_size*y_move),obj_water)))){
		x-=x_move*move_speed
		y-=y_move*move_speed
		if place_meeting(x-(x_move*move_speed),y-(y_move*move_speed),obj_player) and not push_check{
			obj_player.x-=x_move*move_speed
			obj_player.y-=y_move*move_speed
			obj_player.moving = false
		}
		moving = false
	}
}
function ice_move(){
	x+=x_move*move_speed
	y+=y_move*move_speed
	if place_meeting(x,y,obj_gap) and not place_meeting(x,y,obj_box_parent) and not object_index == obj_box_phased{
		fell = true
	}
	if place_meeting(x,y,collide){
		x-=x_move*move_speed
		y-=y_move*move_speed
		moving = false
	}
}
image_speed = 0