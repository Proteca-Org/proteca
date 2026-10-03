if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && (room = rmAnxiety3) && !interagido){
	var dialog = instance_create_layer(0, 0, "Instances", objDialog);
    dialog.objectName = "irmao-ansiedade";
	interagido = true;
}