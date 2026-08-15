senhaCorreta = global.paperPassword;
estado = "play";
senhaDigitada = "";
maxDigitos = 4;
abertoAgora = true;
depth = -9999

// Centralizar em espaço de GUI, não de mundo
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
x = guiWidth / 2;
y = guiHeight / 2;

global.emInspecao = true;

text1 = "Você está\npronto para\niniciar o jogo?"
text2 = "Digite os quatro\nnúmeros da senha:"
text3 = "Parabéns!"
text4 = "Você encontrou a mochila"