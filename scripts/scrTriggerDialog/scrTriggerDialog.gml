function scrTriggerDialog(caller) {
    var dialog = instance_create_layer(caller.x, caller.y, caller.dialogLayer, objDialog);
    dialog.objectName = caller.dialogName;
    global.dialog = true;
    caller.dialogOpened = true; 

    if (caller.missionFlag != "") {
        scrCompleteMission(caller.missionFlag);
    }
}