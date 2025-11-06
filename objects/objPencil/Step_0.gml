/// @description Verifica clique e abre diálogo
if (srcCanOpenDialog(x, y, sprPencil)
    && (!variable_global_exists("dialog") || !global.dialog)
    && !global.pause && !global.inventory
) {
	var dialog = instance_create_layer(x, y, "Instances", objDialog)
	dialog.objectName = "Lápis da introdução";
	global.dialog = true;
}
