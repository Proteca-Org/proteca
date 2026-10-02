// TIO Parado

if (contador_parado > 0)
{
    contador_parado--;
    
    // Mostra o primeiro frame da sprite
    image_index = 0;
	
	if (contador_parado == 0)
    {
        image_index = 1;
    }
    
    exit;
}

// ESCOLHE O DESTINO

var alvo;

if (destino == 1)
{
    alvo = ponto_a;
}
else
{
    alvo = ponto_b;
}

// DISTÂNCIA ATÉ O DESTINO
var distancia = point_distance(x, y, alvo.x, alvo.y);

// AINDA NÃO CHEGOU
if (distancia > 2)
{
    // Calcula a direção até o ponto
    var direcao = point_direction(x, y, alvo.x, alvo.y);
    
    // Move o Tio
    x += lengthdir_x(velocidade, direcao);
    y += lengthdir_y(velocidade, direcao);
    
    
    // ANIMAÇÃO DE CAMINHADA
    
    // Avança a animação
    image_index += velocidade_animacao;
    
    // Se chegou ao final dos frames,
    // volta para o primeiro frame DE CAMINHADA
    if (image_index >= image_number)
    {
        image_index = 1;
    }
    
    
    // DEFINE PARA QUAL LADO O TIO OLHA
    if (alvo.x > x)
    {
        image_xscale = escala_x;
    }
    else if (alvo.x < x)
    {
        image_xscale = -escala_x;
    }
}


// CHEGOU AO DESTINO
else
{
    // Coloca o Tio exatamente no ponto
    x = alvo.x;
    y = alvo.y;
    
    // Mostra o frame parado
    image_index = 0;
    
    // Começa a esperar
    contador_parado = tempo_parado;
    
    
    // TROCA O DESTINO
    if (destino == 1)
    {
        destino = 2;
    }
    else
    {
        destino = 1;
    }
}