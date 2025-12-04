/// @description Verifica clique e abre diálogo
if (srcCanOpenDialog(x, y, sprSchoolLocker)
    && (!variable_global_exists("dialog") || !global.dialog)
    && !global.pause && !global.inventory
) {
	var dialog = instance_create_layer(x, y, "Instances", objDialog)
	dialog.objectName = "Armário da introdução";
	global.dialog = true;
	
	if (!layer_exists("TopLayer")) {
        layer_create(-100000, "TopLayer");
    }
	
    global.viewSchoolLocker = instance_create_layer(
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        "TopLayer",
        objLockerFromSchool
    );
    
    global.viewSchoolLocker.image_xscale = 20;
    global.viewSchoolLocker.image_yscale = 20;
}

if (variable_global_exists("viewSchoolLocker") && instance_exists(global.viewSchoolLocker) && !global.dialog) {
    if (mouse_check_button_released(mb_left)) {
       instance_destroy(global.viewSchoolLocker);
       global.dialog = false
       global.viewSchoolLocker = undefined; 
    }
}