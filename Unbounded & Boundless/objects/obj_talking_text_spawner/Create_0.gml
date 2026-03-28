start_x = x
start_y = y
index = 0
global.talking_data.speech.box_full = false
global.talking_data.speech.done_talking = false
typist = scribble_typist()
typist.in(scroll_speed,0)
image_speed = 0
image_index = not image_index
function write_text(){
	scribble(text).scale(1.75)
	scribble(text).starting_format("fnt_outline_text",c_white)
	scribble(text).wrap(global.text_data.width,global.text_data.height)
	scribble(text).draw(x,y,typist)
	if index >= scribble(text).get_glyph_count() and not global.talking_data.speech.done_talking{
		global.talking_data.speech.box_full = true
	}
	else if not global.talking_data.speech.box_full{
		index += scroll_speed*1.025
	}
	if scribble(text).on_last_page(){
		global.talking_data.speech.done_talking = false
	}
	if global.talking_data.speech.talking_unpaused{
		global.talking_data.speech.talking_unpaused = false
		global.talking_data.speech.box_full = false
		global.talking_data.speech.done_talking = false
		scribble(text).page(scribble(text).get_page()+1)
	}
}