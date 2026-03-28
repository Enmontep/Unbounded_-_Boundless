function mouse_collide(){
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);
	if ((collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)){
		return true
	}
	return false
}
function mouse_clicked(){
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);
	if ((collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)) and mouse_check_button_released(mb_left){
		return true
	}
	return false
}