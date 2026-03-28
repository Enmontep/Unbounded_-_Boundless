if y <= y_end and wait != 0{
	y+= move_speed
}
else if wait >= 1{
	wait -= 1
}
else{
	y-=move_speed
}
if wait == 0 and y = -64{
	instance_destroy(self)
}
draw_self()