hair = 0
blouse = 0
pants = 0
shoes = 0
accessory = 0
xScale = 2
yScale = 2

// Posições-alvo
initialized = false;
targetX = x;
targetY = y;
storedTargetX = x 
storedTargetY = y 

life = 100
score = 0
level = 1
inventory = []
capacity = 10
velocity = 4

// Define quais sprites o personagem vai usar.
walkSpr = sprWalk;
idleSpr = sprIdle;
sprite_index = sprIdle;  // default
image_index = 0;  // frame atual da animação (0=primeiro)

//face: direção que o personagem está olhando, é usada em step
face = 1; //default 

// Por algum motivo colisões só funcionam corretamente com isso...
image_xscale=0.5;
image_yscale=0.5;

// Define a "entrada" inicial do player em uma sala/room.
/*coloquei apenas como left, right, top, bottom e default, mas teria 
que ver melhor como fazer ele aparecer na frente de portas ao atravessá-las, por exemplo*/
global.player_entry = "default";

// Controla se roupas adicionais vão aparecer no sprite ou não (p/ testes)
showClothes = false;
