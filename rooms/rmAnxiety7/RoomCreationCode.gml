if (!global.dialogoAnsiedade7Visto) {

    var dialog = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objDialog);
    dialog.objectName = "ansiedade-7";

    global.dialogoAnsiedade7Visto = true;
}

if (!global.dialogoAnsiedade8Visto && global.anxietyDefeated) {

    var dialog = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objDialog);
    dialog.objectName = "ansiedade-8";

    global.dialogoAnsiedade8Visto = true;
}

