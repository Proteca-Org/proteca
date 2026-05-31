if (!variable_global_exists("dialog") || !global.dialog) {
    var dialog = instance_create_layer(x, y, "Instances_1", objDialog)
    
    dialog.objectName = "Introducao"
    global.dialog = true
}