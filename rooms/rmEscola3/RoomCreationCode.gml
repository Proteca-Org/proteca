// Ajusta propriedades da camera para seguir o player
var _cam = view_get_camera(0)
camera_set_view_size(_cam, global.viewSizeX, global.viewSizeY)
camera_set_view_border(_cam, global.viewSizeX/2, global.viewSizeY/2)
camera_set_view_target(_cam, objPlayer)