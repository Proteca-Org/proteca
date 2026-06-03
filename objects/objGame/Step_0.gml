
spritePosX = x + offsetX;
spritePosY = y + offsetY;

// Sprite Play
if (estado == "play") {
    
    if (mouse_check_button_pressed(mb_left)) {
        
        // Clicou na sprite play
        if (mouse_x >= spritePosX && mouse_x <= spritePosX + spriteLargura &&
            mouse_y >= spritePosY && mouse_y <= spritePosY + spriteAltura) {
            
            estado = "senha";
            senhaDigitada = "";
            
            // Atualiza para sprite da senha
            spriteOriginalLargura = sprite_get_width(sprGame2);
            spriteOriginalAltura = sprite_get_height(sprGame2);
            spriteLargura = spriteOriginalLargura * escalaGame;
            spriteAltura = spriteOriginalAltura * escalaGame;
        }
    }
}

// Sprite senha
else if (estado == "senha") {
    
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord("0") + i)) {
            if (string_length(senhaDigitada) < maxDigitos) {
                senhaDigitada += string(i);
            }
        }
    }
    
    // Backspace
    if (keyboard_check_pressed(vk_backspace)) {
        senhaDigitada = string_copy(senhaDigitada, 1, string_length(senhaDigitada) - 1);
    }
    if (mouse_check_button_pressed(mb_left)) {
        
        // Clicou na sprite
        if (mouse_x >= spritePosX && mouse_x <= spritePosX + spriteLargura &&
            mouse_y >= spritePosY && mouse_y <= spritePosY + spriteAltura) {
            
           if (senhaDigitada == senhaCorreta) {
                estado = "sucesso";
                
                // Atualizar para as dimensões da sprite de sucesso
                spriteOriginalLargura = sprite_get_width(sprGameSucess);
                spriteOriginalAltura = sprite_get_height(sprGameSucess);
                spriteLargura = spriteOriginalLargura * escalaGame;
                spriteAltura = spriteOriginalAltura * escalaGame;
                
            } else {
                // Senha errada
                senhaDigitada = "";
            }
        }
    }
}
//Sprite sucesso
else if (estado == "sucesso") {
    
    if (mouse_check_button_pressed(mb_left)) {
        
        if (mouse_x >= spritePosX && mouse_x <= spritePosX + spriteLargura &&
            mouse_y >= spritePosY && mouse_y <= spritePosY + spriteAltura) {            
            if (!global.dialog && !global.pause && !global.isInventoryOpen) {
                var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
                dialog.objectName = "Inventario desbloqueado";
                global.dialog = true;
            }            
            if (!instance_exists(objInventoryBag)) {
                var bag = instance_create_layer(0, 0, "Instances_2", objInventoryBag);
                // Ajuste a posição se necessário
                bag.x = 350;
                bag.y = 380;
            //Completa a primeira missão
                scrCompleteMission("flag_backpack_found");

            }           
            //Destrói cadeado
            if (instance_exists(objPadlock)) {
                instance_destroy(objPadlock);
            }
            
            // Sai da inspeção
           with (objSchoolLocker) {
                if (modoInspecao) {
                    
                    // Restaura armário
                    x = posicaoOriginalX;
                    y = posicaoOriginalY;
                    image_xscale = tamanhoOriginalX;
                    image_yscale = tamanhoOriginalY;
                    objPlayer.emInspecao = false;
                    modoInspecao = false;
                }
            }
            instance_destroy();
        }
    }
}
