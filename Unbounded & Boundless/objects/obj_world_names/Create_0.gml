x = 640/2
y = -64
move_speed = 8
y_end = 360/2
wait = 64
image_xscale = 2
image_yscale = 2
if room == rm_crate_1{
	image_index = 0
}
else if room == rm_ice_1{
	image_index = 1
}
else if room == rm_grid_1{
	image_index = 2
}
else if room == rm_pool_1{
	image_index = 3
}
else if room == rm_phased_1{
	image_index = 4
}
else if room == rm_quantum_1{
	image_index = 5
}
else if room == rm_crusher_1{
	image_index = 6
}
else if room == rm_laser_1{
	image_index = 7
}
else if room == rm_trial_1{
	image_index = 8
}
else{
	image_index = 9
}
image_speed = 0