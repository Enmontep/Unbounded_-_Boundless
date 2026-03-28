if flip{
	with obj_active{
		if active_id == other.active_id{
			other.activators += 1
		}
	}
	with obj_port{
		if active_id == other.active_id{
			other.activators += 1
		}
	}
}
flip = false
active_activators = 0
with obj_active{
	if (active_id == other.active_id) and active{
		other.active_activators += 1
	}
}
with obj_port{
	if (active_id == other.active_id) and active{
		other.active_activators += 1
	}
}
if active_activators == activators{
	image_yscale = 1
	image_xscale = 1
	
}
else{
	image_xscale = closed_xscale
	image_yscale = closed_yscale
}