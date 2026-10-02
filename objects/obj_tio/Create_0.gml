// Velocidade do Tio
velocidade = 1.5;

// Velocidade da animação
velocidade_animacao = 0.07;

// Define para qual ponto ele está indo
destino = 1;

// Tempo que ele ficará parado
tempo_parado = 60;

// Contador do tempo parado
contador_parado = 0;

// Guarda o tamanho original da sprite
escala_x = image_xscale;
escala_y = image_yscale;

// Começa no frame parado
image_index = 0;

// Desativar a animação automática
image_speed = 0;

// Pontos que o tio ira
ponto_a = instance_find(obj_ponto_tio_a, 0);
ponto_b = instance_find(obj_ponto_tio_b, 0);