if obj_player.phased{
	if !surface_exists(surf)
	{
	    var _cw = camera_get_view_width(view_camera[0])
	    var _ch = camera_get_view_height(view_camera[0])
	    surf = surface_create(_cw, _ch)
	    surface_set_target(surf)
	    draw_set_colour(color)
	    draw_set_alpha(0)
	    draw_rectangle(0, 0, _cw, _cw, false)
	    surface_reset_target()
	}
	else
	{
		if (surface_exists(surf)) {
			var _cw = camera_get_view_width(view_camera[0])
			var _ch = camera_get_view_height(view_camera[0])
			var _cx = camera_get_view_x(view_camera[0])
			var _cy = camera_get_view_y(view_camera[0])
			surface_set_target(surf)
			draw_set_color(color)
			draw_set_alpha(0.5)
			draw_rectangle(0, 0, _cw, _ch, 0)
			gpu_set_blendmode(bm_subtract)
			with (obj_phased)
			    {
					var _sw = sprite_width / 2
					var _sh = sprite_height / 2
					switch(object_index)
					{
					case obj_phased:
					    draw_sprite_ext(spr_phased, 0, x - _cx, y - _sh - _cy, 1, 1, 0, c_white, 1)            
					    break
					}
			    }
			gpu_set_blendmode(bm_normal)
			draw_set_alpha(1)
			surface_reset_target()
			draw_surface(surf, _cx, _cy)
		}
	}
}