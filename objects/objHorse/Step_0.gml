if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && !instance_exists(objHorseMinigame) && !(room = rmAnxiety3)) {

    var puzzle = instance_create_depth(
        0,
        0,
        -1000,
        objHorseMinigame
    );
    puzzle.can_interact = true;
    puzzle.horse_original = id;
}
if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && (room = rmAnxiety3)){
	var dialog = instance_create_layer(x, y, "Instances", objDialog);
    dialog.objectName = "cavalo-ansiedade";
}