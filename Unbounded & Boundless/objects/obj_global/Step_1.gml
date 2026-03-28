if not global.title_done and flip{
	layer_sequence_create("Assets_1",x,y,sq_title)
}
else if global.title_done{
	var sprite = layer_sprite_create("Assets_1",104,202,spr_player)
	layer_sprite_xscale(sprite,6)
	layer_sprite_yscale(sprite,6)
	layer_sprite_speed(sprite,0)
	layer_sprite_create("Assets_1",56,20,spr_title)
}
if file_exists("save.txt") and flip{
	load()
	if global.save_data.room >= 1 global.save_data.bounded = false
	if global.save_data.room >= 18 global.save_data.can_phase = true
}
flip = false