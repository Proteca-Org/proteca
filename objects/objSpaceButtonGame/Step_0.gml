// Dispara o minigame de ansiedade na primeira tentativa de movimento
if (!anxiety_triggered && !global.anxietyDefeated && !instance_exists(objDialog)) {

    var tentou_mover =
        keyboard_check(vk_left) || keyboard_check(vk_right) ||
        keyboard_check(vk_up)   || keyboard_check(vk_down) || mouse_check_button_pressed(mb_left);

    if (tentou_mover) {
        visible = true;
        anxiety_triggered = true;
        objPlayer.emInspecao = true;
    }
}

if (keyboard_check_pressed(vk_space)) {

    if (!bar_started) {
        bar_started = true;
        sprite_index = -1;
    }

    anxiety_value += fill_amount;
}

if (bar_started) {

    anxiety_value -= drain_speed;
    anxiety_value = clamp(anxiety_value, 0, anxiety_max);

    if (anxiety_value >= anxiety_max) {

        global.anxietyMinigameActive = false;
        objPlayer.emInspecao = false;

        var _fade = instance_create_layer(0, 0, "Instances", objFade);
        _fade.target_x = 444;
        _fade.target_y = 270;

        if (room == rmAnxiety) {
            _fade.target_room = rmAnxiety2;
        }
        else {
            _fade.target_room = rmAnxiety4;
            global.anxietyDefeated = true;
        }

        instance_destroy();
        anxiety_triggered = false;
    }
}