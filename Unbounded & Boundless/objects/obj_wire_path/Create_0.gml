active_id = 0
active = false
color = 0
can_active = false
instances = []
active_checks = 0
wired = true
if place_meeting(x,y,obj_player_dead){
	array_push(instances,instance_place(x,y,obj_player_dead))
}
if place_meeting(x+global.grid_size,y,obj_player_dead){
	array_push(instances,instance_place(x+global.grid_size,y,obj_player_dead))
}
if place_meeting(x-global.grid_size,y,obj_player_dead){
	array_push(instances,instance_place(x-global.grid_size,y,obj_player_dead))
}
if place_meeting(x,y+global.grid_size,obj_player_dead){
	array_push(instances,instance_place(x,y+global.grid_size,obj_player_dead))
}
if place_meeting(x,y-global.grid_size,obj_player_dead){
	array_push(instances,instance_place(x,y-global.grid_size,obj_player_dead))
}