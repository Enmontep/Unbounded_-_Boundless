if collider.player_in and global.input_data.actions.pressed(global.input_data.keys.interact) and not global.talking_data.speech.talking{
	global.talking_data.speech.talking = true
	make_text_spawner("<-- Cubert Squareson III's House.               Bounder Shrine -->",1)
}