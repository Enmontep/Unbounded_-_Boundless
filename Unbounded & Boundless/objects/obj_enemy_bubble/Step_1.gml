if not obj_player.phased{
	if place_meeting(x+global.grid_size,y,obj_player){
		obj_player.breath = 10
	}
	if place_meeting(x-global.grid_size,y,obj_player){
		obj_player.breath = 10
	}
	if place_meeting(x,y+global.grid_size,obj_player){
		obj_player.breath = 10
	}
	if place_meeting(x,y-global.grid_size,obj_player){
		obj_player.breath = 10
	}
}