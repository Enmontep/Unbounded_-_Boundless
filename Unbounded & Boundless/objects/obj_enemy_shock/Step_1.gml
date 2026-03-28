if (not moving) and true_flip{
	var temp = noone
	if place_meeting(x+global.grid_size,y,obj_switch){
		temp = instance_place(x+global.grid_size,y,obj_switch)
		temp.active = true
	}
	if place_meeting(x-global.grid_size,y,obj_switch){
		temp = instance_place(x-global.grid_size,y,obj_switch)
		temp.active = true
	}
	if place_meeting(x,y+global.grid_size,obj_switch){
		temp = instance_place(x,y+global.grid_size,obj_switch)
		temp.active = true
	}
	if place_meeting(x,y-global.grid_size,obj_switch){
		temp = instance_place(x,y-global.grid_size,obj_switch)
		temp.active = true
	}
	true_flip = false
}
if moving and not true_flip{
	true_flip = true
}
if not obj_player.phased{
	if place_meeting(x+global.grid_size,y,obj_player){
		obj_player.dead = true
	}
	if place_meeting(x-global.grid_size,y,obj_player){
		obj_player.dead = true
	}
	if place_meeting(x,y+global.grid_size,obj_player){
		obj_player.dead = true
	}
	if place_meeting(x,y-global.grid_size,obj_player){
		obj_player.dead = true
	}
}