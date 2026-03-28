if sequence.frame >= frame or global.title_done{
	y = done_y
	global.title_done = true
}
else{
	y = -100
	sequence.frame += sequence.speed
}
if mouse_collide(){
	x = off_x-4
}
else{
	x = off_x
}
if mouse_clicked(){
	with obj_popup{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = true
			}
		}
	}
	with obj_button_no{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = true
			}
		}
	}
	with obj_button_yes{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = true
			}
		}
	}
}
if mouse_collide(){
	if on_flip{
		
		on_flip = false
	}
}
else{
	on_flip = true
}