function scrGetDialogs(objectName) {
	if ((!variable_global_exists("dialogsLoaded")) || (!global.dialogsLoaded)) {
		var file = "dialogs.JSON"
		if (file_exists(file)) {
			var buffer = buffer_load(file)
			var jsonStr = buffer_read(buffer, buffer_text)
			buffer_delete(buffer)
			global.dialogs = json_parse(jsonStr)
			global.dialogsLoaded = true
		} else {
			show_debug_message("Erro: o arquivo de textos não foi encontrado")
			global.dialogs = {}
			global.dialogsLoaded = true
		}
	}
	
	if (variable_struct_exists(global.dialogs, objectName)) {
		return global.dialogs[$ objectName]
	} else {
		return []
	}
}