initialized = false;

if (room == rmEscola4) {
	objPlayer.x = room_width * 0.60
	objPlayer.y = room_height * 0.5
}

if (global.hasEnteredRoom == false) {
    objPlayer.x = room_width / 2;
    objPlayer.y = room_height / 2;

    global.hasEnteredRoom = true;
}