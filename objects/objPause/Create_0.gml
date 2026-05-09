/// @description Cria menu de pausa

if (instance_number(objPause) > 1) {
    instance_destroy();
    exit;
}

global.pause = false

options = ["Retomar", "Salvar jogo", "Configurações", "Sair"]
numOptions = array_length(options)
selectedOption = 0
