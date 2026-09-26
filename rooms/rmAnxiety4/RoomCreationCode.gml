if (!global.dialogoAnsiedade4Visto) {

    var dialog = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objDialog);
    dialog.objectName = "ansiedade-4";

    global.dialogoAnsiedade4Visto = true;
}
if (global.anxietyDefeated && instance_exists(warp5)) {
    instance_destroy(warp5);
}