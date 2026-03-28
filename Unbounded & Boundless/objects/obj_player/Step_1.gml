if (not moving) and  ((not place_meeting(x,y,obj_water)) or (place_meeting(x,y,obj_water) and place_meeting(x,y,obj_box_float))){
	safe.x = x
	safe.y = y
}
if phased{
	layer_add_instance("Phantom_Player",self)
}
else{
	layer_add_instance("Player",self)
}