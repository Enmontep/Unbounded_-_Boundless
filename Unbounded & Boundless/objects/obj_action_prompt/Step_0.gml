if flip{
	count = string_length(pop_title)*2
}
flip = false
if y < 32 and step = 0{
	y+=4
}
else if y == 32 and count !=0{
	count -= 1
	step = 1
}
else if count <= 0{
	y-=4
}
if y == -4{
	instance_destroy(self)
}