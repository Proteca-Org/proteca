/*

*/

enum MinigameState {
	IDLE,
	STARTSCREEN,
	PLAYING,
	END,
	DONE
}

enum foodIndexes {
	friedEgg = 0,
	lettuceLeaf = 1,
	saladLeaves = 2,
	slicedTomato = 3,
	steak = 4
}

state = MinigameState.IDLE
global.plateClean = false

guiW = display_get_gui_width()
guiH = display_get_gui_height()
guiSprX = guiW/2
guiSprY = guiH/2 // -3
guiPlayButtonX =  guiSprX - 5
guiPlayButtonY =  guiSprY + 165
itensScale = 0.8

heroChair = instance_find(objChair1, 0)
// ovo, repolho, folhas salada,, tomate, carne
eatenFoods = [false, false, false, false, false]
leftFoods = array_length(eatenFoods)

text1_1 = "Você está pronto para iniciar o jogo?"
text1_2 = "Clique na comida até que o prato fique vazio!"
text2_1 = "Parabéns!"
text2_2 = "Você finalizou o mini game!"

drawMinigameSpriteButtonExt = function drawMinigameSpriteButtonExt(_sprite, _subImg, _x, _y, _xScale, _yScale, _rot, _color, _alpha) {
	//var _w = sprite_get_width(_sprite)
	//var _h = sprite_get_height(_sprite)
	var _w = sprite_get_bbox_right(_sprite)*_xScale
	var _h = sprite_get_bbox_bottom(_sprite)*_yScale
	var _mx = device_mouse_x_to_gui(0)
	var _my = device_mouse_y_to_gui(0)
	var _hover = point_in_rectangle(_mx, _my, _x - _w/2, _y - _h/2, _x + _w/2, _y + _h/2)
	var _held = _hover && mouse_check_button(mb_left)
	//var _hover = collision_point(_mx, _my, _sprite, true, false)
	draw_sprite_ext(_sprite, _subImg, _x, _y, _xScale, _yScale, _rot, _color, _alpha)
	
	//return (_hover != noone) && mouse_check_button_pressed(mb_left)
	return _hover && mouse_check_button_pressed(mb_left)
}