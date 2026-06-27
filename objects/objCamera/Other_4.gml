view_enabled = true; // adicionei pra que não precise checar enable views em todos os quartos
view_set_visible(0, true);

var _cam = view_get_camera(0)

camera_set_view_size(_cam, global.viewSizeX, global.viewSizeY)

// Centraliza a câmera na sala
var _cam_x = room_width / 2 - global.viewSizeX / 2;
var _cam_y = room_height / 2 - global.viewSizeY / 2;
camera_set_view_pos(_cam, _cam_x, _cam_y);
