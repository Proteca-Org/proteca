if (srcCanOpenDialog()) {
    dialogInitialized = true;
}
if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}
if (dialogInitialized && distance_to_object(objPlayer) <= 15) {
    // Cria o cadeado 1 vez
    if (!cadeadoCriado) {
        var padlock = instance_create_depth(x, y, -50, objPadlock);
        padlock.x = x + 10;
        padlock.y = y + 30;
        padlock.image_xscale = 0.4;
        padlock.image_yscale = 0.4;
        cadeadoCriado = true;
    }
    // Modo inspeção
    if (!modoInspecao
        && (!variable_global_exists("dialog") || !global.dialog)
        && !global.pause
        && !global.inventory) {

        modoInspecao = true;
        mask_index = -1;
        // Salva posição original
        global.posPlayerOriginalX = objPlayer.x;
        global.posPlayerOriginalY = objPlayer.y;
        posicaoOriginalX = x;
        posicaoOriginalY = y;
        tamanhoOriginalX = image_xscale;
        tamanhoOriginalY = image_yscale;
        image_xscale = tamanhoOriginalX * fatorAumento;
        image_yscale = tamanhoOriginalY * fatorAumento;
        x = 230;
        y = 20;
        // Mover cadeado junto
        with (objPadlock) {
            x = other.x + 50;
            y = other.y + 150;
        }
        // Posicionar player
        objPlayer.x = x - 30;
        objPlayer.y = y + 170;
        objPlayer.emInspecao = true;
        var dialog = instance_create_layer(x, y, "Instances", objDialog);
        dialog.objectName = "Armário";
        global.dialog = true;
        dialogInitialized = false;
    }
}
// Sair do modo com ESC
if (modoInspecao && keyboard_check_pressed(vk_escape)) {
    // Restaurar armário
    x = posicaoOriginalX;
    y = posicaoOriginalY;
    image_xscale = tamanhoOriginalX;
    image_yscale = tamanhoOriginalY;
    // Restaurar cadeado
    with (objPadlock) {
        x = other.x + 10;
        y = other.y + 30;
    }
    // Restaurar player
    objPlayer.x = global.posPlayerOriginalX;
    objPlayer.y = global.posPlayerOriginalY;
    objPlayer.emInspecao = false;
    modoInspecao = false;
    // Remover diálogo
    if (instance_exists(objDialog)) {
        instance_destroy(objDialog);
    }
    // Remover minigame
    if (instance_exists(objGame)) {
        instance_destroy(objGame);
    }
    global.dialog = false;
}