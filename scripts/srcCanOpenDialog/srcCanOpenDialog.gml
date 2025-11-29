function srcCanOpenDialog() {
    // position_meeting verifica se o ponto (mouse) toca na colisão da instância atual (id)
    var mouseAbove = position_meeting(mouse_x, mouse_y, id);
    var clicked = mouse_check_button_pressed(mb_left);

    if (clicked && mouseAbove && !instance_exists(objDialog)) {
        return true; 
    }
    return false;
}