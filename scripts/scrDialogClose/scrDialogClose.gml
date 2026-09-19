function scrDialogClose(){
	global.dialogConsumedClick = true;
	instance_destroy();
	global.dialog = false;
}