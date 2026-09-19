// Anda até targetX/targetY quando a cutscene (ação "move") definir um alvo diferente da posição atual
if (!initialized) {
    targetX = x;
    targetY = y;
    initialized = true;
}

var distance = point_distance(x, y, targetX, targetY);
var tolerance = 2;

if (distance > tolerance && distance > velocity) {
    var dir = point_direction(x, y, targetX, targetY);
    var moveX = lengthdir_x(velocity, dir);
    var moveY = lengthdir_y(velocity, dir);

    if (!place_meeting(x + moveX, y, objCollider)) x += moveX;
    if (!place_meeting(x, y + moveY, objCollider)) y += moveY;
} else {
    x = targetX;
    y = targetY;
}

depth = -bbox_bottom;

// Interação clicável (NPC da escola) — desativada durante cutscenes pra não abrir o diálogo errado
if (!global.cutscene && srcCanOpenDialog()) {
    var dialog = instance_create_layer(0, 0, "Instances", objDialog);
    dialog.objectName = "IrmaoNPC";
    scrCompleteMission("flag_brother_found");
}