// Calcula a base do sprite
var base_y = y+sprite_height/2-100; 

// Checa se o player existe no quarto
if (instance_exists(objPlayer)) {
	
	// Se a posição vertical do player é mais p/ cima que a do objeto
    if (objPlayer.y < base_y) {
        depth = -base_y // coloca objeto na frente do player
    } else {
        depth = -(base_y - 1); // objeto aparece atrás do player
    }
}