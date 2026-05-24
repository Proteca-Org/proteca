initialized = false;

if (room == rmEscola4) {
	objPlayer.x = room_width * 0.60
	objPlayer.y = room_height * 0.5
}

if (global.hasEnteredRoom == false) {
    objPlayer.x = room_width / 2;
    objPlayer.y = 3*room_height / 4;

    global.hasEnteredRoom = true;
}