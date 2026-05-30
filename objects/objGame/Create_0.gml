estado = "play";
senhaCorreta = global.paperPassword;
senhaDigitada = "";
maxDigitos = 4;

// Posição e escala
escalaGame = 0.4;      
offsetX = -120;  
offsetY = -250;        
depth = -150
// Centralizar o objeto
var cam = view_camera[0];
if (cam >= 0) {
    x = camera_get_view_x(cam) + (camera_get_view_width(cam) / 2);
    y = camera_get_view_y(cam) + (camera_get_view_height(cam) / 2);
} else {
    x = room_width / 2;
    y = room_height / 2;
}

// Calcular a posição da sprite
spritePosX = x + offsetX;
spritePosY = y + offsetY;

spriteOriginalLargura = sprite_get_width(sprGame);
spriteOriginalAltura = sprite_get_height(sprGame);

spriteLargura = spriteOriginalLargura * escalaGame;
spriteAltura = spriteOriginalAltura * escalaGame;

global.emInspecao = true;