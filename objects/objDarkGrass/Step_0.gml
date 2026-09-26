image_alpha = 0.5; 

if (global.anxietyDefeated) {
if (image_alpha != 1) {
    image_alpha = 1; 
}
if (mouse_check_button_pressed(mb_left) && (distance_to_object(objPlayer) < 15 )) {
    show_debug_message("Fui para a fase 3");
}
}