if (video_get_status() == video_status_closed) {
	video_close()
    instance_activate_object(objPlayer)
    room_goto_next()
}
