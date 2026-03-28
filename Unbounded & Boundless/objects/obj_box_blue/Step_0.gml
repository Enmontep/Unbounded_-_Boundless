if not instance_exists(other_id){
	instance_create_layer(x,y,"Instances",obj_box_quantum)
	instance_destroy(self)
}