function write_text(){
	scribble(text).scale(1.75)
	scribble(text).starting_format("fnt_outline_text",c_white)
	scribble(text).wrap(global.text_data.width)
	scribble(text).draw(x,y,typist)
}
text = "You have beat all of the game that has been made so far, replay it, break it, I don't care, I'm busy making more stuff"
typist = scribble_typist()
typist.in(0.5,0)
