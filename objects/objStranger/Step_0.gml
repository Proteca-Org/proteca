if (distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left) && (room = rmAnxiety3) && !interagido){
	var dialog = instance_create_layer(0, 0, "Instances", objDialog);
    dialog.objectName = "irmao-ansiedade";
	interagido = true;
}

// Cena 3b da floresta: clicar no estranho deitado o faz levantar e continua o dialogo.
// Guardas: room certa, fora de cutscene, uma unica vez, perto do jogador.
if (room == rmForestEncounter && !global.cutscene && !interagido
    && distance_to_object(objPlayer) < 15 && mouse_check_button_pressed(mb_left)) {
    interagido = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_encontro_fim"));
}