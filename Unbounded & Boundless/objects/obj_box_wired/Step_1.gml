ids = []
if active_check(x+(global.grid_size),y,[obj_wire_path,obj_active]){
	array_push(ids,instance_place(x+global.grid_size,y,[obj_wire_path,obj_active]).active_id)
}
if active_check(x-global.grid_size,y,[obj_wire_path,obj_active]){
	array_push(ids,instance_place(x-global.grid_size,y,[obj_wire_path,obj_active]).active_id)
}
if active_check(x,y+global.grid_size,[obj_wire_path,obj_active]){
	array_push(ids,instance_place(x,y+global.grid_size,[obj_wire_path,obj_active]).active_id)
}
if active_check(x,y-global.grid_size,[obj_wire_path,obj_active]){
	array_push(ids,instance_place(x,y-global.grid_size,[obj_wire_path,obj_active]).active_id)
}
if array_length(ids) > 0{
	for (var i = 0; i< array_length(ids); i += 1){
		if i == 0{
			other_id = ids[i]
		}
		else if ids[i] < other_id{
			other_id = ids[i]
		}
	}
	for (var i = 0; i< array_length(ids); i += 1){
		if i == 0{
			active_id = ids[i]
		}
		else if ids[i] > active_id{
			active_id = ids[i]
		}
	}
	with obj_active{
		if active_id == other.other_id{
			other.active = active
		}
	}
}
else{
	other_id = -1
	active_id = -1
	active = false
}
image_index = active
with obj_wire_path{
	if active_id == other.active_id{
		active = other.active
	}
}