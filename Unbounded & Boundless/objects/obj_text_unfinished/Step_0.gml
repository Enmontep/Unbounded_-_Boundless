if place_meeting(x,y,obj_player){
	global.talking_data.speech.talking = true
	make_text_spawner(text,1)
	instance_destroy(self)
}