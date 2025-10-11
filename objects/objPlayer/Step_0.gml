if (!initialized) {
	targetX = x;
	targetY = y;
	initialized = true;
}

var dx = targetX - x;
var dy = targetY - y;
var distance  = point_distance(x, y, targetX, targetY);
var tolerance = 2;

// Define a posição dos "pés" do sprite (usada para colisões)
var foot_x = x;
var foot_y = y + (sprite_height / 2) + 40; // offset pra baixo

// Define profundidade com base na posição Y p/ que objetos mais baixos sejam desenhados "na frente"
depth = -y;

if (distance > tolerance && distance > velocity) {
    var dir = point_direction(x, y, targetX, targetY);
	
	// Código anterior
    // x += lengthdir_x(velocity, dir);
    // y += lengthdir_y(velocity, dir);	
	
	// Converte velocidade + direção em deslocamentos de movimento X e Y
	var move_x = lengthdir_x(velocity, dir);
	var move_y = lengthdir_y(velocity, dir);

	// Verificações de movimento x e y somente se não houver colisão com pés
		if (!place_meeting(foot_x + move_x, foot_y, all)) {
			x += move_x;}

		if (!place_meeting(foot_x, foot_y + move_y, all)) {
			y += move_y;}
	
	
	// muda sprite para andando
	sprite_index = walkSpr;
} else {
    x = targetX;
    y = targetY;
	
	// muda sprite para parado
	sprite_index = sprIdle;
}

// no clique ele define o target_x e target_y e verifica a posição para o player nao sair da tela
if (mouse_check_button_pressed(mb_left)) {
    var pauseButtonHalfWidth = sprite_get_width(sprPauseButton) / 2;
    var pauseButtonHalfHeight = sprite_get_height(sprPauseButton) / 2;

    // verifica se bão clicou no botão pause
    if (!point_in_rectangle(mouse_x, mouse_y,
        global.xPauseButton - pauseButtonHalfWidth,
        global.yPauseButton - pauseButtonHalfHeight,
        global.xPauseButton + pauseButtonHalfWidth,
        global.yPauseButton + pauseButtonHalfHeight))
    {
        targetX = mouse_x;
        targetY = mouse_y;
        
        if (targetX > (room_width - (sprite_get_width(sprBlouses) / 2))){
            targetX = room_width - sprite_get_width(sprBlouses) / 2;
        }
        
        if (targetX < (sprite_get_width(sprBlouses) / 2)){
            targetX = sprite_get_width(sprBlouses) / 2;
        }
        
        if (targetY > (room_height - sprite_get_height(sprBlouses))){
            targetY = (room_height - sprite_get_height(sprBlouses));
        }
        
        if (targetY < sprite_get_height(sprBlouses)){
            targetY = sprite_get_height(sprBlouses);
        }
		
		// Determina a direção do sprite com base no clique
		if (targetX > x) {
            face = 1; // voltado para a direita
        } else if (targetX < x) {
            face = -1;  // voltado para a esquerda
        }
    }
}

// Faz com que o personagem pareça maior quando mais perto da 
/* var min_scale = 0;  
var max_scale = 4.3;   
var t = clamp(y / room_height, 0, 1);
var final_scale = lerp(min_scale, max_scale, t);
xScale = final_scale;
yScale = final_scale;
*/

#region Dialog System
	if (keyboard_check_pressed(ord("F"))) {
		var dialog = instance_create_layer(x, y, "Instances", objDialog)
		dialog.npcName = "Teste Geral";
	}
#endregion

