global.input_data = {
	keys : {
		up : 87,
		left : 65,
		down : 83,
		right : 68,
		interact : 69
	},
	actions : {
		held : keyboard_check,
		pressed : keyboard_check_pressed,
		released : keyboard_check_released
	}
}
	
global.pause_data = {
	is_paused : false,
	just_unpaused : false,
	tab : 0,
	page : {
		current : 0,
		max : [0,0,1,0,0,0]
	},
	menu_paused : true,
	talk_paused : false
}

global.talking_data = {
	spawner : {
		x : 32,
		y : 240 
	},
	speech : {
		talking : false,
		done_talking : false,
		talking_unpaused : false,
		box_full : false
	}
}

global.text_data = {
	width : 576,
	height : 96
}

global.save_data = {
	room : rm_square_1,
	bounded : true,
	camera_bounded : true,
	read_stature : false,
	can_phase : false
}
	
global.reset_data = {
	room : rm_square_1,
	bounded : true,
	camera_bounded : true,
	read_stature : false,
	can_phase : false
}

global.box_data = {
	
}
global.grid_made = false
global.current_world = []
global.grid_size = 32
global.title_done = false
global.level_end = false
scribble_font_bake_outline_and_shadow("fnt_default","fnt_outline",0,0,SCRIBBLE_OUTLINE.EIGHT_DIR,8,false)
scribble_font_bake_outline_and_shadow("fnt_default","fnt_outline_text",0,0,SCRIBBLE_OUTLINE.EIGHT_DIR,2,false)