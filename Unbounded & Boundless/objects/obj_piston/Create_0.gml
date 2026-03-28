if image_angle == 0 or abs(image_angle) == 360{
	facing = 0
}
else if abs(image_angle) == 180{
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
image_speed = 0
pushable = [obj_box_parent,obj_enemy_unphased]
pushed = noone
pushing = false
push_speed = 4
can_push = true
push_length = 4
pushed_start = {
	x : 0,
	y : 0
}