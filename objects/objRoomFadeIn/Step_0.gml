fade_alpha -= fade_speed;

if (fade_alpha <= 0) {
     fade_alpha -= fade_speed;

    if (instance_exists(objPlayer)) {
        objPlayer.emInspecao = false;
    }
	
    fade_alpha = 0;

    var dialog = instance_create_layer(x, y, "Instances", objDialog);
    dialog.objectName = "lamentando";

    instance_destroy();
}