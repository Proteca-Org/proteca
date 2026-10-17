function scrPauseSelection(option){
	switch (option) {
		case 0:
			global.pause = false
			break
			
		case 1:
			scrSaveGame()
			break
			
		case 2:
		    var pauseMenu = instance_find(objPause, 0);
		    pauseMenu.settings_open = true;
		    instance_create_depth(0, 0, -10001, objSettingsMenu);
		    break
		case 3:
			if (!global.dialog) {
				var confirmDialog = instance_create_depth(0, 0, -10001, objDialog)
				confirmDialog.objectName = "confirmar_menu_principal"
				confirmDialog.depth = -10001
				global.dialog = true
			}
			break
		case 4:
			game_end()
			break
	}
}
