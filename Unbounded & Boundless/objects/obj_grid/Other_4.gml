if not global.grid_made{
	room_x = room_width
	room_y = room_height
	image_xscale = room_x/global.grid_size
	image_yscale = room_y/global.grid_size
	global.grid_made = true
}
grid_fill()