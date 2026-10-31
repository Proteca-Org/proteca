// Movimento por cutscene: anda ate targetX/targetY (ex.: o cavalo trota para fora de cena apos relinchar).
if (!initialized) {
    targetX = x;
    targetY = y;
    initialized = true;
}
var _d = point_distance(x, y, targetX, targetY);
if (_d > 2 && _d > velocity) {
    var _dir = point_direction(x, y, targetX, targetY);
    x += lengthdir_x(velocity, _dir);
    y += lengthdir_y(velocity, _dir);
} else {
    x = targetX;
    y = targetY;
}

// O minigame de doma so abre nas rooms de doma da floresta e fora de cutscene.
if ((room == rmForestHorse || room == rmForestHorseII) && !global.cutscene
    && distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left)
    && !instance_exists(objHorseMinigame)) {

    var puzzle = instance_create_depth(
        0,
        0,
        -1000,
        objHorseMinigame
    );
    puzzle.can_interact = true;
    puzzle.horse_original = id;
}
if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && (room = rmAnxiety3) && !interagido){
	var dialog = instance_create_layer(x, y, "Instances", objDialog);
    dialog.objectName = "cavalo-ansiedade";
	interagido = true;
}