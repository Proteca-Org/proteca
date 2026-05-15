initialized = false;

var newRoomStartPosition = variable_global_get("newRoomStartPosition")
if (is_struct(newRoomStartPosition) && newRoomStartPosition != undefined) {
	objPlayer.x = newRoomStartPosition.x
	objPlayer.y = newRoomStartPosition.y
	// Evita sobreescrever em outras salas que não tem warp por diálogo
	global.newRoomStartPosition = undefined 
}

if (global.hasEnteredRoom == false) {
    objPlayer.x = room_width / 2;
    objPlayer.y = room_height / 2;

    global.hasEnteredRoom = true;
}