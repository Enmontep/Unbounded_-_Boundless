if color_flip{
	for (var i = 0; i < array_length(colors); i++){
		if color == colors[i]{
			image_index = i+1
		}
	}
	color_flip = false
}
if image_angle == 0 or abs(image_angle) == 360{
	facing = 0
}
else if image_angle == 180{
	facing = 1
}
if image_angle == 90 or image_angle == -270{
	facing = 2
}
else if image_angle == 270 or image_angle == -90{
	facing = 3
}
else{
	facing = 0
}
if image_angle == 180{
	facing = 1
}