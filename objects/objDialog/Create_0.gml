objectName = ""
dialogData = undefined
text[0] = ""

page = 0
initialized = false

isBranching = false
currentNodeKey = "inicio" 
currentNodeData = undefined
optionHeight = 40
optionMargin = 10
hoveredOption = -1 // Para saber qual opção está com o mouse em cima na hora de desenhar

guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()

currentSpeechText = ""; // Fala atual usada como gatilho para ações da cutscene
depth = -9999
