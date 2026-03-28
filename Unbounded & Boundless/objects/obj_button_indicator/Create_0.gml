image_speed = 0
collider = instance_nearest(x,y,obj_player_in)
start_x = x
start_y = y
function check_button_type(button=69){
	change_key(button)
}
function change_key(new_key){
	sprite_index = spr_button_key
	if new_key >= 8 and new_key <= 9 image_index = new_key-8+2
	if new_key == 13 image_index = 4
	if new_key >= 16 and new_key <= 19 image_index = new_key-16+5
	if new_key == 27 image_index = 6
	if new_key >= 32 and new_key <= 40 image_index = new_key-32+7
	if new_key >= 44 and new_key <= 46 image_index = new_key-44+16
	if new_key >= 48 and new_key <= 57 image_index = new_key-48+19
	if new_key >= 65 and new_key <= 90 image_index = new_key-65+29
	if new_key >= 96 and new_key <= 123 image_index = new_key-96+55
	if new_key >= 160 image_index = new_key-160+83
	if new_key >= 219 image_index = new_key-219+89
	if new_key >= 186 and new_key <= 191 image_index = new_key-186+94
}
function change_mouse(new_mouse){
	sprite_index = spr_button_mouse
	image_index = new_mouse
}
function change_gamepad_button(new_button){
	sprite_index = spr_button_gamepad
}