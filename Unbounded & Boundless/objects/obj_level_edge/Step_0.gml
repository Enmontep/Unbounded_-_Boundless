if place_meeting(x,y,obj_player) and end_edge{
	global.level_end = true
	if flip{
		audio_stop_all()
		audio_play_sound(snd_level_end,0,false)
		flip = false	
	}
	end_edge = true
}