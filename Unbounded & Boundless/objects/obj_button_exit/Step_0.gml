if sequence.frame >= frame or global.title_done{
	y = done_y
}
else{
	y = -100
	sequence.frame += sequence.speed
}
if mouse_collide(){
	x = off_x-4
}
else{
	x = off_x
}
if mouse_clicked(){
	game_end()	
}
if mouse_collide(){
	if on_flip{
		
		on_flip = false
	}
}
else{
	on_flip = true
}