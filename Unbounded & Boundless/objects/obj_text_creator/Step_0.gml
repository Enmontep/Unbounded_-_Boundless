if global.save_data.read_stature and first and flip{
	instance_create_layer(x,y,"Decor",obj_text_creator,{text:"(A shrine of the bounder, a person who can leave the bounds of reality)",first:false})
	instance_destroy(self)
}
flip = false
if collider.player_in and global.input_data.actions.pressed(global.input_data.keys.interact) and not global.talking_data.speech.talking{
	global.talking_data.speech.talking = true
	make_text_spawner(text,1)
	if first{
		instance_create_layer(x,y,"Decor",obj_text_creator,{text:"(A shrine of the bounder, a person who can leave the bounds of reality)",first:false})
		instance_destroy(self)
	}
}