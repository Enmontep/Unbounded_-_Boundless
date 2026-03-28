instance_create_layer(0,0,"UI",obj_grid)
global.save_data.room = room
if room != rm_square_1{
	global.save_data.bounded = false
}
else{
	global.save_data.bounded = true
}
if room >= 18{
	global.save_data.can_phase = true
}
global.level_end = false
crate = [rm_crate_1,rm_crate_2,rm_crate_3,rm_crate_4]
ice = [rm_ice_1,rm_ice_2,rm_ice_3,rm_ice_4]
grid = [rm_grid_1,rm_grid_2,rm_grid_3,rm_grid_4]
pool = [rm_pool_1,rm_pool_2,rm_pool_3,rm_pool_4]
phase = [rm_phased_1,rm_phased_2,rm_phased_3,rm_phased_4]
quantum = [rm_quantum_1,rm_quantum_2,rm_quantum_3,rm_quantum_4]
crusher = [rm_crusher_1,rm_crusher_2,rm_crusher_3,rm_crusher_4]
laser = [rm_laser_1,rm_laser_2,rm_laser_3,rm_laser_4]
save()
if room == rm_title{
	audio_play_sound(snd_title,0,true)
}
else if room == rm_square_1{
	audio_play_sound(snd_square_1,0,true)
}
else if array_contains(crate,room){
	audio_play_sound(snd_crate,0,true)
	global.current_world = crate
}
else if array_contains(ice,room){
	audio_play_sound(snd_ice,0,true)
	global.current_world = ice
}
else if array_contains(grid,room){
	audio_play_sound(snd_grid,0,true)
	global.current_world = grid
}
else if array_contains(pool,room){
	audio_play_sound(snd_pool,0,true)
	global.current_world = pool
}
else if array_contains(phase,room){
	audio_play_sound(snd_phase,0,true)
	global.current_world = phase
}
else if array_contains(quantum,room){
	audio_play_sound(snd_quantum,0,true)
	global.current_world = quantum
}
else if array_contains(crusher,room){
	audio_play_sound(snd_crusher,0,true)
	global.current_world = crusher
}
else if array_contains(laser,room){
	audio_play_sound(snd_laser,0,true)
	global.current_world = laser
}
else if room == rm_trial_1{
	audio_play_sound(snd_trial,0,true)
	global.current_world = rm_trial_1
}