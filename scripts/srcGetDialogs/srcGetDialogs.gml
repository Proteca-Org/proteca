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

function scrResolveGenderTokens(text) {
	var result = text;
	var guard = 0;
	
	while (string_pos("{", result) > 0 && guard < 20) {
		guard++;
		
		var openPos = string_pos("{", result);
		var closePos = string_pos("}", result);
		
		if (closePos <= openPos) {
			break;
		}
		
		var token = string_copy(result, openPos + 1, closePos - openPos - 1);
		var colonPos = string_pos(":", token);
		
		if (colonPos <= 0) {
			break;
		}
		
		var scope = string_copy(token, 1, colonPos - 1);
		var key = string_copy(token, colonPos + 1, string_length(token) - colonPos);
		
		var genderValue = "M";
		if (scope == "player") {
			genderValue = global.playerGender;
		} else if (scope == "sibling") {
			genderValue = global.siblingGender;
		}
		
		var terms = scrGetDialogs("_genderTerms");
		var replacement = "{" + token + "}";
		
		if (is_struct(terms) && variable_struct_exists(terms, key)) {
			var termEntry = terms[$ key];
			if (variable_struct_exists(termEntry, genderValue)) {
				replacement = termEntry[$ genderValue];
			} else if (variable_struct_exists(termEntry, "M")) {
				replacement = termEntry[$ "M"];
			}
		} else {
			show_debug_message("Aviso: token de gênero não encontrado: " + token);
			break;
		}
		
		result = string_replace_all(result, "{" + token + "}", replacement);
	}

	return result;
}

/// Separa o locutor declarado no nível do diálogo dos dados de fala.
/// Aceita o formato antigo (array de falas ou struct de nós ramificados)
/// e o novo { "speaker": ..., "lines": [...] }.
function scrDialogUnwrap(_data) {
	if (is_struct(_data) && variable_struct_exists(_data, "lines")) {
		return {
			speaker : variable_struct_exists(_data, "speaker") ? _data.speaker : "",
			data : _data.lines
		}
	}

	return { speaker : "", data : _data }
}

/// Normaliza uma entrada de diálogo em { speaker, text }, com tokens de gênero já resolvidos.
/// Aceita tanto uma string solta (formato antigo) quanto um struct { speaker, text }.
/// _fallbackSpeaker é o locutor declarado no nível do diálogo, usado quando a entrada não traz o seu.
function scrDialogResolveEntry(_entry, _fallbackSpeaker) {
	var _speaker = _fallbackSpeaker
	var _text = ""

	if (is_struct(_entry)) {
		if (variable_struct_exists(_entry, "speaker")) {
			_speaker = _entry.speaker
		}
		if (variable_struct_exists(_entry, "text")) {
			_text = _entry.text
		}
	} else if (is_string(_entry)) {
		_text = _entry
	}

	return {
		speaker : scrResolveGenderTokens(_speaker),
		text : scrResolveGenderTokens(_text)
	}
}
