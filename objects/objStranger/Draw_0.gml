draw_self();

// Destaque pulsante (igual ao da mesa de jantar) para chamar atencao de que o
// estranho deve ser clicado para ficar de pe (cena 3b da floresta).
if (room == rmForestEncounter && !global.cutscene && !interagido) {
	var _alpha = (sin(current_time / 200) + 1) / 4;

	gpu_set_fog(true, c_white, 0, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, _alpha);
	gpu_set_fog(false, c_white, 0, 1);
}
