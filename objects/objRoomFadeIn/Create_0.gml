fade_alpha = 1;   // começa totalmente escuro
fade_duration = 3; // segundos
fade_speed = 0.75 / (fade_duration * room_speed);
if (instance_exists(objPlayer)) {
    objPlayer.emInspecao = true;
}
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();