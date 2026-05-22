// Definicao de algumas constantes globais
// Os valores abaixo foram obtidos de forma que a imagem obtida tivesse resolucao igual a 75% do tamanho original da fase
global.viewSizeX = 527
global.viewSizeY = 416 

// Ajusta propriedades da camera para seguir o player
var _cam = view_get_camera(0)
camera_set_view_size(_cam, global.viewSizeX, global.viewSizeY)
camera_set_view_border(_cam, global.viewSizeX/2, global.viewSizeY/2)
camera_set_view_target(_cam, objPlayer)