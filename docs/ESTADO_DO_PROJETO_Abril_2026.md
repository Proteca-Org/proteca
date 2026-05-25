# Estado do Projeto — Jogo Proteca

> 2026-04-28  
> Engine: GameMaker Studio 2 (v2024.13.1.193)  
> Resolução: 720×720 px | 60 FPS |

---

## 1. Visão Geral Técnica

### Arquitetura

O projeto segue uma arquitetura **orientada a objetos com estados globais**. Cada sala tem um ou dois objetos "gerenciadores" responsáveis pela lógica daquela cena. A comunicação entre sistemas usa variáveis globais como flags de estado.

**Padrões identificados:**

| Padrão | Onde é usado |
|--------|-------------|
| **State flags globais** | `global.pause`, `global.dialog`, `global.inventory` — evita sobreposição de sistemas |
| **Construtores GML** | `Inventory()` e `Item()` com métodos definidos internamente (OOP via constructors) |
| **Menus em dois níveis** | `objCustom` usa `currentMenu` (0 = categorias, 1 = opções da categoria) |
| **Movimento suave por alvo** | `objPlayer` usa `point_distance()` + `lengthdir_*()` para interpolação de posição |
| **Dados externos em JSON** | Diálogos carregados de `datafiles/dialogs.JSON` com cache em `global.dialogs` |
| **Separação GUI/World** | `device_mouse_x_to_gui()` usado corretamente para coordenadas de interface |

### Estrutura de Diretórios Relevante

```
proteca/
├── datafiles/          # Dados externos (dialogs.JSON, Intro.mp4)
├── fonts/              # 4 fontes (fntMenu, fntDialog, fntCustomization, fntPressStart)
├── objects/            # 8 objetos (7 funcionais + 1 legado)
├── rooms/              # 5 salas (4 ativas + 1 legado "Room1")
├── scripts/            # 6 scripts (1 duplicado com convenção inconsistente)
└── sprites/            # 10 sprites (8 de uso ativo + 2 legado)
```

---

## 2. Sistemas Implementados

### Funcionais (com código ativo)

| Sistema | Objeto/Script | Funcionalidade |
|---------|--------------|----------------|
| **Menu Principal** | `objMenu` | 3 opções (Novo Jogo, Carregar, Sair), navegação por teclado e mouse, highlight de seleção |
| **Vídeo de Intro** | `objVideo` | Reprodução de `Intro.mp4`, pause/resume, skip, avanço automático de sala ao terminar |
| **Customização de Personagem** | `objCustom` + `scrCustomDone` | 5 categorias (cabelo×6, blusas×5, calças×5, sapatos×3, acessórios×7), preview em 5× com navegação completa |
| **Movimentação do Player** | `objPlayer` | WASD + setas, click-to-move com alvo suave, detecção de colisão com botão de pause |
| **Sistema de Pausa** | `objPause` | Botão visível em gameplay, overlay semi-transparente, 4 opções de menu, ESC toggle |
| **Inventário** | `objInventory` + `scrInventoryDefinitions` | Grid 4×4 (16 slots), abertura com M, seleção de slot, estrutura de dados `Item()` completa |
| **Sistema de Diálogos** | `objDialog` + `srcGetDialogs` | Caixa na base da tela, múltiplas páginas via clique, carregamento de JSON com cache, pausa o player durante exibição |

### Infraestrutura pronta (sem conteúdo)

- **Fontes tipográficas:** 4 fontes configuradas com suporte a caracteres acentuados (PT-BR)
- **Estrutura `Inventory`/`Item`:** Métodos `addItem()`, `removeItem()`, `inspectItem()`, `useItem()` existem — precisam de lógica real
- **JSON de diálogos:** Schema definido e funcionando — precisa de mais entradas

---

## 3. Mapeamento de Fluxo

```
rmMenu
  │
  │  [Enter] "Novo Jogo"
  ▼
rmVideo
  │  Intro.mp4 tocado por objVideo
  │  (objPlayer desativado durante o vídeo)
  │
  │  [automático ao terminar] ou [skip]
  ▼
rmCustomization
  │  objCustom: seleção de cabelo, blusa, calça, sapato, acessório
  │  Preview em tempo real do personagem
  │
  │  [Enter] "Pronto!"  →  scrCustomDone()
  ▼
rmLevel1
  ├── objPlayer  (spawn dinâmico, persistente, com customização aplicada)
  ├── objPause   (botão + menu de pausa)
  └── objInventory (grid de itens, M para abrir)
       │
       ├── [ESC]    →  Menu de pausa (Retomar / Salvar / Configs / Sair)
       ├── [M]      →  Inventário
       └── [clique em NPC/objeto]  →  objDialog (multi-página via JSON)
```

**Observação:** `scrMenuSelection` usa `room_goto(1)` hardcoded em vez do nome da sala — o fluxo depende da ordem de compilação do projeto, não de nomes explícitos.

---

## 4. Estágio de Desenvolvimento

### **Protótipo Avançado / Pré-MVP**

| Critério | Avaliação |
|---------|-----------|
| Loop de jogo completo | Não — falta objetivo, progresso e feedback de vitória/derrota |
| Sistemas de UI | ✅ Funcionais e polidos (menus, customização, pausa, inventário) |
| Conteúdo jogável | Minimal — apenas movimentação livre em uma sala vazia |
| Qualidade do código | Sólida na maior parte; bugs pontuais identificados |
| Assets visuais | Sprites de personagem completos; sem tilesets ou cenário |
| Dados / Conteúdo | 1 diálogo de teste; sem NPCs, itens reais ou eventos |
| Estabilidade | Funciona sem crashes aparentes; bugs não-críticos presentes |

**Resumo:** A infraestrutura técnica (engine de UI, customização, diálogos) está bem construída para um protótipo. O jogo ainda não tem um **loop de gameplay central** — não há objetivo, obstáculos, NPCs com função ou conteúdo de nível real. O próximo passo natural é definir a mecânica principal e adicionar conteúdo ao `rmLevel1`.

---

## 5. Pendências Identificadas

### Bugs Conhecidos

| Severidade | Local | Descrição |
|-----------|-------|-----------|
| **Alta** | `scrCustomDone`, linha 11 | `playerInstance.y = x` deveria ser `playerInstance.y = y` — posiciona o player na coordenada errada |
| **Média** | `scrInventoryDefinitions` | Loop com `<=` em array de 16 elementos acessa índice 16 (fora dos limites) |
| **Baixa** | `scrMenuSelection` | `room_goto(1)` hardcoded — frágil se a ordem das salas mudar |
| **Baixa** | `srcGetDialogs` | Nome com "src" em vez de "scr" — inconsistência de convenção |

### Funcionalidades Placeholder

| Feature | Status | Onde |
|---------|--------|------|
| Salvar Jogo | `show_message()` apenas | `scrPauseSelection` opção 1 |
| Carregar Jogo | `show_message()` apenas | `scrMenuSelection` opção 1 |
| Configurações | `show_message()` apenas | `scrPauseSelection` opção 2 |
| Efeito de item | `effect_item()` indefinida | `Inventory.useItem()` |
| Conteúdo de diálogos | 4 linhas de teste | `datafiles/dialogs.JSON` |

### Sistemas Ausentes

- **Gameplay central:** Sem objetivos, missões, obstáculos ou condição de vitória/derrota
- **NPCs funcionais:** Nenhum NPC com IA ou diálogo real
- **Level Design:** `rmLevel1` é uma sala vazia — sem tilesets, colisões de cenário ou pontos de interesse
- **Múltiplos níveis:** Apenas uma sala de gameplay existe
- **Sistema de save/load:** Estrutura de dados não definida ainda
- **Itens reais no inventário:** Os itens de teste (cabelo, calças) são apenas dados — sem uso funcional

### Código a Limpar

| Arquivo | Problema |
|---------|---------|
| `scripts/inventario/inventario.gml` | Duplicata de `scrInventoryDefinitions` com naming inconsistente (snake_case vs camelCase) |
| `objects/Object1/` | Objeto vazio sem função, legado |
| `rooms/Room1/` | Sala legada sem uso |
| `sprites/Sprite1/` e `sprSprite1/` | Sprites placeholder sem uso |
