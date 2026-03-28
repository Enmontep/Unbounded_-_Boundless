if not player_moved() and global.save_data.camera_bounded{
	with obj_player_bounded_touch_x{
		if place_meeting(x,y,walls){
			other.x_moving = false
		}
		else{
			other.x_moving = true 
		}
	}
	with obj_player_bounded_touch_y{
		if place_meeting(x,y,walls){
			other.y_moving = false
		}
		else{
			other.y_moving = true 
		}
	}
	if x_moving{
		x = obj_player.x
	}
	if y_moving{
		y = obj_player.y
	}
}
else if not global.save_data.camera_bounded{
	x = obj_player.x
	y = obj_player.y
}