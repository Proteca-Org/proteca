#region customization

// Opção 1: Estilo do cabelo
feature[0,0] = "Longo 1"
feature[0,1] = "Longo 2"
feature[0,2] = "Médio 1"
feature[0,3] = "Médio 2"
feature[0,4] = "Curto 1"
feature[0,5] = "Curto 2"

// Opção 2: Vestimenta superior
feature[1,0] = "Blusa roxa"
feature[1,1] = "Camiseta verde"
feature[1,2] = "Camiseta amarela"
feature[1,3] = "Camiseta azul"
feature[1,4] = "Camiseta vermelha"

// Opção 3: Vestimenta inferior
feature[2,0] = "Calça azul"
feature[2,1] = "Calça laranja"
feature[2,2] = "Bermuda azul"
feature[2,3] = "Bermuda verde"
feature[2,4] = "Bermuda amarela"

// Opção 4: Sapatos
feature[3,0] = "Tênis"
feature[3,1] = "Chinelo"
feature[3,2] = "Bota"

// Opção 5: Acessórios
feature[4,0] = "Nenhum"
feature[4,1] = "Cabeça 1"
feature[4,2] = "Cabeça 2"
feature[4,3] = "Cabeça 3"
feature[4,4] = "Cabeça 4"
feature[4,5] = "Mão 1"
feature[4,6] = "Olhos 1"

numFeatures = array_length(feature)

// selectedFeature[i] := opcao selecionada na customizacao i
for (var i = 0; i < numFeatures; i++) {
	selectedFeature[i] = 0
}

// selectedPart := qual parte do personagem esta sendo alterada atualmente
selectedPart = 0
part[0] = "Cabelo"
part[1] = "Vestimenta superior"
part[2] = "Vestimenta inferior"
part[3] = "Sapatos"
part[4] = "Acessórios"

// 0 se menu atual é o das customizacoes, 1 se menu atual é o das opcoes dentro de uma customizacao
currentMenu = 0

// se torna 1 quando a customizacao é finalizada
done = 0
#endregion

#region drawing

// Escala em que o personagem é desenhado
xScale = 5
yScale = 5

// (x,y) em que o personagem é desenhado (centralizado)
// no lugar de sprHair poderia ser qualquer outra sprite do personagem
x = room_width / 2
y = room_height - (sprite_get_height(sprHair) * yScale) + 100

#endregion