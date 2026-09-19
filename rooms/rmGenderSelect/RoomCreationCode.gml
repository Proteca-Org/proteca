// objPlayer é persistente e sobreviveu à customização: esconde durante a escolha
if (instance_exists(objPlayer)) {
	objPlayer.visible = false;
}

var dialog = instance_create_layer(0, 0, "Instances", objDialog);
dialog.objectName = "GenderSelect";
