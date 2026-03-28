with obj_player{
	if place_meeting(x,y,obj_false_border){
		other.flip = true
	}
}
if flip{
	x = obj_player.x
	y = obj_player.y
	if place_empty(x+global.grid_size,y){
		x+=global.grid_size
	}
	else if place_empty(x,y-global.grid_size){
		y-=global.grid_size
	}
	else if place_empty(x-global.grid_size,y){
		x-=global.grid_size
	}
	else if place_empty(x,y+global.grid_size){
		y+=global.grid_size
	}
	if place_meeting(x+global.grid_size,y,obj_border_parent){
		x-=(global.grid_size*8)+(global.grid_size*6)
	}
	else if place_meeting(x-global.grid_size,y,obj_border_parent){
		x+=(global.grid_size*10)+(global.grid_size*4)
	}
	if place_meeting(x,y+global.grid_size,obj_border_parent){
		y-=(global.grid_size*6)
	}
	else if place_meeting(x,y-global.grid_size,obj_border_parent){
		y+=(global.grid_size*8)+(global.grid_size)
	}
	flip = false
}