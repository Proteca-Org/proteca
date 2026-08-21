if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && !instance_exists(objHorseMinigame)) {

    var puzzle = instance_create_depth(
        0,
        0,
        -1000,
        objHorseMinigame
    );
    puzzle.can_interact = true;
    puzzle.horse_original = id;
}