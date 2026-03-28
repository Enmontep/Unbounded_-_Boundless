if color_flip{
	for (var i = 0; i < array_length(colors); ++i) {
	    if color == colors[i]{
			image_index = i+1
			color_id = i+1
		}
	}
	color_flip = false
}
if active{
	image_index = color_id + 3
}
else{
	image_index = color_id
}