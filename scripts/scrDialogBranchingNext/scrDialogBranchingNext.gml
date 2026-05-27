function scrDialogBranchingNext(){
	if (variable_struct_exists(currentNodeData, "options")) {
		return
	}
	
	scrDialogExecuteAction()
	scrDialogClose()
}