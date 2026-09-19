draw_self();

if (!variable_global_exists("quartoArrumado")) global.quartoArrumado = false;

if (!global.quartoArrumado) {
	var alpha = (sin(current_time / 200) + 1) / 4; 
	
	gpu_set_fog(true, c_white, 0, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
	gpu_set_fog(false, c_white, 0, 1);
}