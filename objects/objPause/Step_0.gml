/// @description Trata a solicitação de pausa/retorno pelo teclado
if (keyboard_check_pressed(vk_escape)) {
	global.pause = !global.pause
}
