if place_meeting(x,y,obj_player){
	if can_player{
		obj_player.phased = not obj_player.phased
		can_player = false
	}
}
else{
	can_player = true
}
if place_meeting(x,y,obj_box_default){
	var instance = instance_place(x,y,obj_box_default)
	if array_contains(pha_boxs,instance){
		instance.moving = true
	}
	else if not instance.moving{
		var new_ins = instance_create_layer(instance.x,instance.y,"Phantom_Instances",obj_box_phased)
		var temp = {
			x : instance.xprevious-instance.x,
			y : instance.yprevious-instance.y
		}
		instance_destroy(instance)
		array_push(reg_boxs,new_ins)
		new_ins.x -= temp.x*4
		new_ins.y -= temp.y*4
		new_ins.moving = true
	}
}
if place_meeting(x,y,obj_box_phased){
	var instance = instance_place(x,y,obj_box_phased)
	if array_contains(reg_boxs,instance){
		instance.moving = true
	}
	else if not instance.moving{
		var new_ins = instance_create_layer(instance.x,instance.y,"Instances",obj_box_default)
		var temp = {
			x : instance.xprevious-instance.x,
			y : instance.yprevious-instance.y
		}
		instance_destroy(instance)
		array_push(pha_boxs,new_ins)
		new_ins.x -= temp.x*4
		new_ins.y -= temp.y*4
		new_ins.moving = true
	}
}
if place_meeting(x,y,obj_enemy_phased){
	var instance = instance_place(x,y,obj_enemy_phased)
	if not array_contains(changed_enemies,instance) and not instance.moving{ 
		var new_ins = instance_create_layer(instance.x+16,instance.y+16,"Instances",obj_enemy_default)
		new_ins.facing = instance.facing
		instance_destroy(instance)
		array_push(changed_enemies,new_ins)
	}
}
if place_meeting(x,y,obj_enemy_default){
	var instance = instance_place(x,y,obj_enemy_default)
	if not array_contains(changed_enemies,instance) and not instance.moving{ 
		var new_ins = instance_create_layer(instance.x+16,instance.y+16,"Instances",obj_enemy_phased)
		new_ins.facing = instance.facing
		instance_destroy(instance)
		array_push(changed_enemies,new_ins)
	}
}
for (var i = 0; i < array_length(pha_boxs); ++i) {
    if not place_meeting(x,y,pha_boxs[i]){
		array_delete(pha_boxs,i,1)
	}
}
for (var i = 0; i < array_length(reg_boxs); ++i) {
    if not place_meeting(x,y,reg_boxs[i]){
		array_delete(reg_boxs,i,1)
	}
}
for (var i = 0; i < array_length(changed_enemies); ++i) {
    if not place_meeting(x,y,changed_enemies[i]){
		array_delete(changed_enemies,i,1)
	}
}