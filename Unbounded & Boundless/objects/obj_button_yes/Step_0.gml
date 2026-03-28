image_index = mouse_collide()
if mouse_clicked(){
	if file_exists("save.txt"){
		file_delete("save.txt")
		global.save_data = global.reset_data
		global.box_data = {}
		if not instance_exists(obj_action_prompt) make_action_prompt("Save has been deleted",1.25)
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
	else{
		if not instance_exists(obj_action_prompt) make_action_prompt("Save Does not exist",1.25)
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