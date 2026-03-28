if global.talking_data.speech.box_full or global.talking_data.speech.done_talking{
	x = start_x
	y = start_y
	if global.input_data.actions.released(global.input_data.keys.interact){		
		global.talking_data.speech.talking = false
		global.pause_data.is_paused = false
		global.talking_data.speech.box_full = false
		global.talking_data.speech.done_talking = false
		x = -100
		y = -100 
		with obj_talking_text_spawner{
			instance_destroy(self)
		}
		
	}
}
else{
	x = -100
	y = -100 
	flip = true
}