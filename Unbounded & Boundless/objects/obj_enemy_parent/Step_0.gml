if not moving and flip == 0{
	if facing == 0{
		check_up()
	}
	else if facing == 1{
		check_left()
	}
	else if facing == 2{
		check_down()
	}
	else{
		check_right()
	}
}
if flip == 32{
	moving = true
	if place_meeting(x+(x_move*4),y+(y_move*4),obj_ice){
		if object_index == obj_enemy_heavy{
			move()
		}
		else{
			ice_move()
		}
	}
	else{
		move()
	}
}
else{
	flip +=1 
}