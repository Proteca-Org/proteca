view_enabled = true; // adicionei pra que não precise checar enable views em todos os quartos
view_set_visible(0, true);

// Ajusta propriedades da camera para seguir o player
var _cam = view_get_camera(0)

camera_set_view_size(_cam, global.viewSizeX, global.viewSizeY)
//camera_set_view_border(_cam, global.viewSizeX/2, global.viewSizeY/2)

// Check if the player exists in this room before targeting them
//if (instance_exists(objPlayer)) {
//	camera_set_view_target(_cam, objPlayer)
//}

// Posição fixa da câmera centralizada 
camera_set_view_pos(_cam, room_width / 2 - global.viewSizeX / 2, room_height / 2 - global.viewSizeY / 2);