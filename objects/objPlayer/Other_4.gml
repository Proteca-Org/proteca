initialized = false

var newRoomStartPosition = global.newRoomStartPosition
if (is_struct(newRoomStartPosition)) {
	objPlayer.x = newRoomStartPosition.x
	objPlayer.y = newRoomStartPosition.y
	// Evita sobreescrever em outras salas que não tem warp por diálogo
	global.newRoomStartPosition = undefined 
}

if (global.hasEnteredRoom == false) {
    objPlayer.x = room_width / 2;
    objPlayer.y = 3*room_height / 4;

    global.hasEnteredRoom = true;
}