popup = instance_nearest(x,y,obj_popup)
image_index = mouse_collide()
if mouse_clicked(){
	with obj_popup{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = false
			}
		}
	}
	with obj_button_no{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = false
			}
		}
	}
	with obj_button_yes{
		if variable_instance_exists(self,"pop_name"){
			if pop_name == "reset"{
				popped = false
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