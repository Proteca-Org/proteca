if (srcCanOpenDialog(x, y, sprFloorPaper)
    && (!variable_global_exists("dialog") || !global.dialog)
    && !global.pause && !global.inventory
) {
    var dialog = instance_create_layer(x, y, "Instances", objDialog);
    dialog.objectName = "Papel da introdução";
    global.dialog = true;
    
	if (!layer_exists("TopLayer")) {
        layer_create(-100000, "TopLayer");
    }
	
    var passwordPaper = instance_create_layer(
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        "TopLayer",
        objPasswordPaper
    );
    
    passwordPaper.image_xscale = 30;
    passwordPaper.image_yscale = 30;
    
	randomize();
	var code = irandom_range(0, 9999);
	global.paperPassword = string_repeat("0", 4 - string_length(string(code))) + string(code);

	passwordPaper.password_code = global.paperPassword;
}
