
function scrLoadSettings() {
    // Valores padrao para quando o jogo iniciar
    global.configuracoes = {
        audio: {
            volume_geral: 1
        },
        texto: {},
        idioma: "pt-BR",
        video: {}
    };

    // Se ainda nao houver arquivo mantemos os valores padrão
    if (!file_exists("configuracoes.json")) {
        return;
    }

    var buffer;
    var jsonStr;
    var dados;

    try {
        buffer = buffer_load("configuracoes.json");
        jsonStr = buffer_read(buffer, buffer_text);
        buffer_delete(buffer);

        dados = json_parse(jsonStr);

        if (is_struct(dados)
        && variable_struct_exists(dados, "audio")
        && variable_struct_exists(dados, "idioma")) {

            global.configuracoes = dados;
        }
    }
    catch (_err) {
        // Se houver erro, valore serao padrao
    }
}