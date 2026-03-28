instance_deactivate_object(obj_box_parent)
instance_activate_object(obj_box_phased)
instance_deactivate_object(obj_enemy_parent)
instance_activate_object(obj_enemy_phased)
if place_meeting(x,y,obj_entity){
	if place_meeting(x,y,obj_player){
		if obj_player.phased{
			image_index = 1
			active = true
		}
	}
	else{
		image_index = 1
		active = true
	}
}
else{
	image_index = 0
	active = false
}
instance_activate_object(obj_box_parent)
instance_activate_object(obj_enemy_parent)