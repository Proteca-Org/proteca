/*
 * Máquina de Estados do minigame do Quarto dos Pais
 * Na primeira vez: IDLE -> START -> MENU -> PLAYING -> DONE -> END -> IDLE
 * Na demais vezes: IDLE -> START -> MENU -> DONE -> END -> IDLE
 */

enum PuzzleState {
	IDLE,
	START,
	MENU,
	PLAYING,
	DONE,
	END
}

state = PuzzleState.IDLE
puzzleCompleted = false
padlockTries = 4

// Configurações para animação do cadeado caindo
padlockAngle = 0
padlockFallY = 0
padlockFallSpeed = 0
padlockAnimationTime = 60
padlockStartAnimation = false
padlockDoneDelay = 0

// animação de Fade ao entrar no minigame
currentAlpha = 0.0
targetAlpha = 0.6
fadeSpeed = 0.02

// Variáveis utilizadas para envento DRAW do MENU
guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()
spriteX = guiWidth/2
spriteY = guiHeight/2
playButtonX = spriteX - 5
playButtonY = spriteY + 150

hasChestBeenPressed = function() {
	if (!mouse_check_button_pressed(mb_left)) {
		return false
	}
	
	if (!point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		return false
	}
	return true
}

// Detectar colisão
playButtonWidth = sprite_get_width(sprButtonPlay)
playButtonHeight = sprite_get_height(sprButtonPlay)
playBtnRect = {
	x1: playButtonX - playButtonWidth/3,
	y1: playButtonY - playButtonHeight/4,
	x2: playButtonX + playButtonWidth/3,
	y2: playButtonY + playButtonHeight/4
}

hasPlayBtnPressed = function() {
	if (!mouse_check_button_pressed(mb_left)) {
		return false
	}
	
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if (!point_in_rectangle(mx, my, playBtnRect.x1, playBtnRect.y1, playBtnRect.x2, playBtnRect.y2)) {
		return false
	}
	return true
}

padlockWidth = sprite_get_width(sprPadlockClosed) * 2
padlockHeight = sprite_get_height(sprPadlockClosed) * 1.5
padlockMargin = 60
padlockRect = {
	x1: spriteX - padlockWidth,
	y1: spriteY + padlockMargin - padlockHeight,
	x2: spriteX + padlockWidth,
	y2: spriteY + padlockMargin + padlockHeight,
}

hasPadlockPressed = function() {
	if (!mouse_check_button_pressed(mb_left)) {
		return false
	}
		
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if (!point_in_rectangle(mx, my, padlockRect.x1, padlockRect.y1, padlockRect.x2, padlockRect.y2)) {
		return false
	}
	return true
}

// Configurações da vibração do cadeado
shakeTime = 0
shakeIntensity = 4
shakeRotation = 10
shakeX = 0
shakey = 0
shakeAngle = 0

// Texto do Menu
text1 = "Você está pronto para iniciar o jogo?"
text2 = "Clique no cadeado até que ceda!"
text3 = "Parabéns!       Você finalizou o mini game!"

mathFadeIn = function(_currentAlpha, _targetAlpha, _fadeSpeed) {
	if (_currentAlpha < _targetAlpha) {
		_currentAlpha += _fadeSpeed
		if (_currentAlpha > _targetAlpha) {
			_currentAlpha = _targetAlpha
		}
	}
	return _currentAlpha
}

mathFadeOut = function(_currentAlpha, _fadeSpeed) {
	if (_currentAlpha > 0.0) {
		_currentAlpha -= _fadeSpeed
		if (_currentAlpha < 0.0) {
			_currentAlpha = 0.0
		}
	}
	return _currentAlpha
}