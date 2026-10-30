
function scrSaveSettings() {
    // Verifica se as configuracoes existem
    if (!variable_global_exists("configuracoes")) {
        return;
    }

    var jsonStr = json_stringify(global.configuracoes);
    var buffer = buffer_create(
        string_byte_length(jsonStr) + 1,
        buffer_fixed,
        1
    );

    buffer_write(buffer, buffer_text, jsonStr);
    buffer_save(buffer, "configuracoes.json");
    buffer_delete(buffer);
}
