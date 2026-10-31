// Define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;
horse_original = noone;
interagido = false;

// Permite que a cutscene mova o cavalo (ex.: fugir de cena apos relinchar).
initialized = false;
targetX = x;
targetY = y;
velocity = 2;

if (room == rmForestHorse && global.horseEscaped) {
    instance_destroy();
    exit;
}
    