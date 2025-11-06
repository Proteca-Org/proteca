/// @description Verifica clique e abre diálogo
if (srcCanOpenDialog(x, y, sprStudentDesk)
    && (!variable_global_exists("dialog") || !global.dialog)
    && !global.pause && !global.inventory
) {
	var dialog = instance_create_layer(x, y, "Instances", objDialog)
	dialog.objectName = "Carteiras da introdução";
	global.dialog = true;
}
