if (global.warp_initiated && point_distance(x, y, objPlayer.x, objPlayer.y) <= 72) {
    room_goto(target_room);
    global.warp_initiated = false; 
} 