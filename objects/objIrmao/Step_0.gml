if (srcCanOpenDialog()) {
    var dialog = instance_create_layer(0, 0, "Instances", objDialog);
    dialog.objectName = "IrmaoNPC";
    scrCompleteMission("flag_brother_found");
}