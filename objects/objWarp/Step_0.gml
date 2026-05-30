if (variable_global_exists("dialog") && global.dialog) {
	exit
}

if place_meeting(x, y, objPlayer) and !instance_exists(objFade) {
		var instantiated = instance_create_depth(0, 0, -9999, objFade);
		instantiated.target_x = target_x;
		instantiated.target_y = target_y;
		instantiated.target_room = target_room;
}	