if (selectedOption == 0) {
	if (video_get_status() == video_status_playing) {
		video_pause()
	} else if (video_get_status() == video_status_paused) {
		video_resume()
	}
} else if (selectedOption == 1) {
	video_close();
	instance_activate_object(objPlayer);
	room_goto_next();
}