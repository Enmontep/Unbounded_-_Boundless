instance_deactivate_object(obj_box_phased)
if facing == 0{
	guide_draw(0,-1)
}
else if facing == 1{
	guide_draw(0,1)
}
else if facing == 2{
	guide_draw(-1,0)	
}
else if facing == 3{
	guide_draw(1,0)	
}

draw_self()
instance_activate_object(obj_box_phased)