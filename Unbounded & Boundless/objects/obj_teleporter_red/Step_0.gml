if other_flip{
	with obj_teleporter_blue{
		if tele_id == other.tele_id{
			other.other_id = id
		}
	}
	other_flip = false
}
if can_tele{
	if place_meeting(x,y,obj_player) and not obj_player.moving{
		obj_player.x = other_id.x+16
		obj_player.y = other_id.y+16
		other_id.can_tele = false
	}
}
if can_box_tele{
	if place_meeting(x,y,obj_box_quantum){
		var temp = instance_place(x,y,obj_box_quantum)
		if not temp.moving{
			instance_destroy(temp)
			var red = instance_create_layer(x,y,"Instances",obj_box_red)
			var blue = instance_create_layer(other_id.x,other_id.y,"Instances",obj_box_blue)
			red.other_id = blue
			blue.other_id = red
		}
	}
	else if place_meeting(x,y,obj_box_default) and not place_meeting(x,y,[obj_box_blue,obj_box_red]){
		var temp = instance_place(x,y,obj_box_default)
		if not temp.moving{
			temp.x = other_id.x+16
			temp.y = other_id.y+16
			other_id.can_box_tele = false
		}
	}
}
if can_enemy_tele{
	if place_meeting(x,y,obj_enemy_quantum){
		var temp = instance_place(x,y,obj_enemy_quantum)
		if not temp.moving{
			instance_destroy(temp)
			var red = instance_create_layer(x+32,y+32,"Instances",obj_enemy_red)
			var blue = instance_create_layer(other_id.x+32,other_id.y+32,"Instances",obj_enemy_blue)
			red.other_id = blue
			blue.other_id = red
			other_id.can_enemy_tele = false
		}
	}
	else if place_meeting(x,y,obj_enemy_parent) and not place_meeting(x,y,[obj_enemy_blue,obj_enemy_red,obj_box_phased]){
		var temp = instance_place(x,y,obj_enemy_parent)
		if not temp.moving{
			temp.x = other_id.x+16
			temp.y = other_id.y+16
			other_id.can_enemy_tele = false
		}
	}
}
if not place_meeting(x,y,obj_player){
	can_tele = true
}
if not place_meeting(x,y,obj_box_default){
	can_box_tele = true
}
if not place_meeting(x,y,obj_enemy_parent){
	can_enemy_tele = true
}
