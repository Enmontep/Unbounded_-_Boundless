function save(){
		var file = file_text_open_write("save.txt")
		file_text_write_real(file,global.save_data.room)
		file_text_close(file)
}
function load(){
	var iter = 0
	var file = file_text_open_read("save.txt")
	global.save_data.room = file_text_read_real(file)
}
