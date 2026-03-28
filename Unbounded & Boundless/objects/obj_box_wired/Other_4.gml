active = false
temp = noone
function active_check(x,y,object){
	if place_meeting(x,y,object){	
		return true
	}
	return false
}
active_id = 0
other_id = 0
ids = []