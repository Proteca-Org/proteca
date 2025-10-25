/// @description Verifica clique e abre diálogo
if (srcCanOpenDialog(x, y, sprStudentDesk)) {
	var dialog = instance_create_layer(x, y, "Instances", objDialog)
	dialog.objectName = "Lápis da introdução";
}
