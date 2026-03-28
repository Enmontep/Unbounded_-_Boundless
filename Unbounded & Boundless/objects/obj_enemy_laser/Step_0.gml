// Inherit the parent event
event_inherited();

if color_flip{
	for (var i = 0; i < array_length(colors); ++i) {
	    if color == colors[i]{
			image_index = i+1
		}
	}
	color_flip = false
}