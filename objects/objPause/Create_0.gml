/// @description Cria menu de pausa

if (instance_number(objPause) > 1) {
    instance_destroy();
    exit;
}

options = ["Retomar", "Salvar jogo", "Configurações", "Menu Principal", "Sair"]
numOptions = array_length(options)
selectedOption = 0
depth = -10000
