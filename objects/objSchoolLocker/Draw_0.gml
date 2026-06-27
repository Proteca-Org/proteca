// No evento Draw do objeto armário
if (modoInspecao) {
    // Desenha o armário na posição original
    draw_sprite_ext(sprite_index, image_index, posicaoOriginalX, posicaoOriginalY, 
                    tamanhoOriginalX, tamanhoOriginalY, 0, c_white, 1);
    
    // Desenha o armário ampliado no centro
    draw_sprite_ext(sprite_index, image_index, 230, 20, 
                    tamanhoOriginalX * fatorAumento, tamanhoOriginalY * fatorAumento, 0, c_white, 1);
} else {
    // Desenho normal
    draw_self();
}