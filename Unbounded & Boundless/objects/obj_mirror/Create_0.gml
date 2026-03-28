if image_angle == 0 or abs(image_angle) == 360{
	facing = 0
}
if image_angle == 180 or image_angle == -180{
	facing = 1
}
if image_angle == 90 or image_angle == -270{
	facing = 2
}
if image_angle == 270 or image_angle == -90{
	facing = 3
}
light = false
color = c_white
rray = 0
light_side = 0
ray_collide = [obj_border,obj_walkable_border,obj_false_border,obj_collide,obj_switch,obj_box_parent,obj_enemy_unphased,obj_player]
function light_change(){
	rray = 0
	var ray = 0
	if light_side == 1{
		if facing == 1{
			ray = guide_draw(1,0)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x,y-16,ray.x+16,ray.y,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 2
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
		}
		else if facing == 2{
			ray = guide_draw(-1,0)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x,y-16,ray.x-16,ray.y,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 3
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
			
		}
	}
	else if light_side == 0{
		if facing == 3{
			ray = guide_draw(1,0)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x,y+16,ray.x+16,ray.y,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 2
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
			
		}
		else if facing == 0{
			ray = guide_draw(-1,0)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x,y+16,ray.x-16,ray.y,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 3
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
			
		}
	}
	else if light_side == 2{
		if facing == 0{
			ray = guide_draw(0,-1)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x+16,y,ray.x,ray.y-16,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 1
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
		}
		else if facing == 2{
			ray = guide_draw(0,1)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x+16,y,ray.x,ray.y+16,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 0
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
			
		}
	}
	else if light_side == 3{
		if facing == 1{
			ray = guide_draw(0,1)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x-16,y,ray.x,ray.y+16,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 0
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
		}
		else if facing == 3{
			ray = guide_draw(0,-1)
			if ray{
				if ray.id.object_index == obj_mirror{
					draw_line_width_colour(x-16,y,ray.x,ray.y-16,2,color,color)
					with ray.id{
						light = true
						color = other.color
						light_side = 1
						light_change()
					}
				}
				else if ray.id.object_index == obj_box_glass{
					with ray.id{
						light_face = other.facing
						color_change()
					}
				}
			}
		}
	}
	draw_self()
	rray = ray
	with obj_port{
	if other.rray{
		if id == other.rray.id and color = other.color{
			active = true
		}
	}
}
}
function guide_draw(xmult,ymult,direct = facing){
	var sray = 0
	var xway = 0
	var yway = 0
	if direct == 1{
		sray = raycast(x-16,y-16,xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
		xway = -16
		yway = -16
	}
	else if direct == 2{
		sray = raycast(x+16,y-16,xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
		xway = 16
		yway = -16
	}
	else if direct == 3{
		sray = raycast(x-16,y+16,xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
		xway = -16
		yway = 16
	}
	else if direct == 0{
		sray = raycast(x+16,y+16,xmult,ymult,(room_width*4*xmult),(room_height*4*ymult),ray_collide)
		xway = 16
		yway = 16
	}
	if sray{
		draw_line_width_colour(x+xway,y+yway,sray.x,sray.y,2,color,color)
	}
	else{
		draw_line_width_colour(x+xway,y+yway,x+(room_width*4*xmult)+xway,y+(room_height*4*ymult)+yway,2,color,color)
	}
	return sray
}