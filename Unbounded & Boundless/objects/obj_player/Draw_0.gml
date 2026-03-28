if dead{
	shader_set(shd_dead)
	death_time -=1
}
if death_time == 0{
	death_time = 32
	dead = false
}
draw_self()
shader_reset()