function scrCutsceneDefinitions(cutscene_id) {
		
    if (cutscene_id == "sala_professora") {
        return [
            { action: "lock_input" },
            { action: "teleport", target: "rmEscola4", target_position: { x: 576, y: 260 } },
            { action: "wait", duration: 120 },
            { action: "dialog", key: "sala_professora" },
			{ action: "wait", duration: 120 },
			{ action: "call_cutscene", cutscene_id: "chegada_floresta" }
        ];
    }
	
	if (cutscene_id == "chegada_floresta") {
	  return [
	    { action: "lock_input" },
        { action: "teleport", target: "rmWalkHome", target_position: { x: 110, y: 370 } },
        { action: "parallel", branches: [
			                                        //Passando o valor direto pois pelo WayPoint da erro
        { action: "move", target: objPlayer, target_position: { x: 674, y: 383 }, velocity: 2 },
		{action: "move", target: objIrmao, target_position: { x: 674, y: 383 }, velocity: 2},
        ]},
        { action: "teleport", delay: 200, target: "rmHouseLivingRoom", target_position: { x: 700, y: 250 }, fade_speed: 0.2 },

        { action: "call_cutscene", cutscene_id: "chegada_casa"}
    ];
	}
	
	if (cutscene_id == "chegada_casa") {
	     return [
			 { action: "set_visible", target: objFather, value: true },
			 { action: "set_visible", target: objMother, value: true },
			 { action: "set_visible", target: objIrmao, value: true },
			 { action: "parallel", branches: [
                { action: "dialog", key: "chegada_casa" },
                { action: "sequence", trigger_text: "Que saco!", steps: [
						{ action: "move", target: objPlayer, target_position: { x: inst_2AAD1E8F.x, y: objPlayer.y }, velocity: 3.5 },
						{ action: "move", target: objPlayer, target_position: { x: inst_2AAD1E8F.x, y: inst_42A66B9B.y}, velocity: 3.5 }
                ]}
            ]},
			{ action: "teleport", target: "rmHouseSiblingsBedRoom", target_position: { x: 140, y: 205 } },
            { action: "unlock_input" }
		];
	}

// ========================

	if (cutscene_id == "quarto_arrumado") {
	    return [
	        { action: "lock_input" },
    
	        { action: "set_face", target: objPlayer, value: 2 },
          { action: "wait", duration: 30 },
        
          { action: "set_visible", target: objIrmao, value: true },

	        { action: "move", target: objIrmao, target_position: { x: objIrmao.x, y: quarto_irmao_1.y }, velocity: 3 },
	        { action: "move", target: objIrmao, target_position: { x: quarto_irmao_2.x, y: quarto_irmao_1.y }, velocity: 3 },
	        { action: "move", target: objIrmao, target_position: { x: quarto_irmao_2.x, y: quarto_irmao_3.y }, velocity: 3 },

	        { action: "set_face", target: objPlayer, value: 0 }, // expressão neutra

	        { action: "dialog", key: "quarto_irmao_1" },
            
	        { action: "move", target: objPlayer, target_position: { x: objPlayer.x, y: quarto_irmao_2.y }, velocity: 3 },
	        { action: "move", target: objPlayer, target_position: { x: quarto_irmao_1.x, y: quarto_irmao_1.y }, velocity: 3 },
	        { action: "move", target: objPlayer, target_position: { x: quarto_irmao_1.x, y: inst_47412913.y }, velocity: 3 },

	        { action: "set_visible", target: objPlayer, value: false },
        
	        { action: "dialog", key: "quarto_irmao_2" },
    
	        { action: "teleport", target: "rmHouseDiningRoom", target_position: { x: 367, y: 270 } },
        
			{ action: "call_cutscene", cutscene_id: "antes_do_jantar" },
	    ];
	}
	
	// Continuacao da cena anterior, mas no outro cenario
	if (cutscene_id == "antes_do_jantar") {
	    return [
	        //{ action: "lock_input" },
			{ action: "set_visible", target: objPlayer, value: true },
			{ action: "set_visible", target: objFather, value: true },
			{ action: "set_visible", target: objMother, value: true },

			{ action: "wait", duration: 30 },
			{ action: "set_visible", target: objIrmao, value: true },
	
	        { action: "move", target: objIrmao, target_position: { x: sala_jantar_irmao_1.x, y: sala_jantar_irmao_1.y }, velocity: 3 },
			{ action: "move", target: objIrmao, target_position: { x: sala_jantar_irmao_2.x, y: sala_jantar_irmao_2.y }, velocity: 3 },	        
			{ action: "move", target: objIrmao, target_position: { x: sala_jantar_irmao_3.x, y: sala_jantar_irmao_3.y }, velocity: 3 },
			
			//{ action: "wait", duration: 100 },
        
			{ action: "dialog", key: "antes_jantar" },
			// TODO alterar rosto irmao para alegria
			
			//{ action: "dialog", key: "antes_jantar_2" },
			
	        { action: "unlock_input" }
	        // TODO prox cena
	    ];
	}

// ========================

	if (cutscene_id == "cutscene_banheiro") {
	    return [
	        { action: "lock_input" },

	        { action: "set_visible", target: objIrmao, value: true },

	        { action: "dialog", key: "banheiro_irmao" },

	        { action: "move", target: objPlayer, target_position: { x: 531, y: 480 }, velocity: 3 },

	        { action: "set_visible", target: objPlayer, value: false },

	        { action: "dialog", key: "banheiro_irmao_sozinho" },

	        { action: "set_visible", target: objIrmao, value: false },

	        { action: "teleport", target: "rmHouseHallway", target_position: { x: 265, y: 300 } },

	        { action: "call_cutscene", cutscene_id: "corredor_para_quarto_pais" }
	    ];
	}

	if (cutscene_id == "corredor_para_quarto_pais") {
	    return [
	        { action: "set_visible", target: objPlayer, value: true },

	        { action: "move", target: objPlayer, target_position: { x: 582, y: objPlayer.y }, velocity: 3 },

	        { action: "move", target: objPlayer, target_position: { x: 582, y: 220 }, velocity: 3 },

	        { action: "teleport", target: "rmParentsBedroom", target_position: { x: 200, y: 250 } },

	        { action: "unlock_input" }
	    ];
	}

// ======================== FLORESTA ========================

	// Cena 1 — rmForestArrival
	if (cutscene_id == "floresta_chegada") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: true },
	        { action: "parallel", branches: [
	            { action: "dialog", key: "chegada_floresta" },
	            { action: "sequence", trigger_text: "Hein, {player:irmaozao_vocativo}, não fique parado aí! Vamos explorar!", steps: [
	                { action: "move", target: objIrmao, target_position: { x: 950, y: objIrmao.y }, velocity: 3 },
	                { action: "set_visible", target: objIrmao, value: false }
	            ]}
	        ]},
	        { action: "unlock_input" }
	    ];
	}

	// Cena 2 — rmForestCrow
	if (cutscene_id == "floresta_corvo") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: true },
	        { action: "parallel", branches: [
	            { action: "dialog", key: "corvo_forest" },
	            { action: "sequence", trigger_text: "Passarinho!", steps: [
	                { action: "move", target: objIrmao, target_position: { x: 950, y: objIrmao.y }, velocity: 3 },
	                { action: "set_visible", target: objIrmao, value: false }
	            ]}
	        ]},
	        { action: "unlock_input" }
	    ];
	}

	// Cena 3a — rmForestEncounter (ao entrar). Cavalo relincha em "Iiiiriri!" (pagina 0 -> sem trigger_text;
	// delay no branch do parallel) e trota para fora de cena pela direita antes de sumir.
	if (cutscene_id == "floresta_encontro") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: true },
	        { action: "parallel", branches: [
	            { action: "dialog", key: "estranho_1a" },
	            { action: "sequence", delay: 45, steps: [
	                { action: "move", target: objHorse, target_position: { x: 1000, y: objHorse.y }, velocity: 4 },
	                { action: "set_visible", target: objHorse, value: false }
	            ]}
	        ]},
	        { action: "unlock_input" }
	    ];
	}

	// Cena 3b — disparada pelo clique no estranho deitado
	if (cutscene_id == "floresta_encontro_fim") {
	    return [
	        { action: "lock_input" },
	        { action: "set_angle", target: objStranger, value: 0 },
	        { action: "dialog", key: "estranho_1b" },
	        { action: "unlock_input" }
	    ];
	}

	// Cena 4 — rmForestHorse (ao entrar)
	if (cutscene_id == "floresta_cavalo1") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: true },
	        { action: "dialog", key: "estranho_2a" },
	        { action: "unlock_input" }
	    ];
	}

	// Cena 4 fim — disparada pela falha do minigame em rmForestHorse
	if (cutscene_id == "floresta_cavalo1_fim") {
	    return [
	        { action: "lock_input" },
	        { action: "dialog", key: "estranho_2b" },
	        { action: "unlock_input" }
	    ];
	}

	// Cena 5a — rmForestHorseII (ao entrar)
	if (cutscene_id == "floresta_cavalo2") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: true },
	        { action: "dialog", key: "estranho_3a" },
	        { action: "unlock_input" }
	    ];
	}

	// Cena 5b/6 — disparada pela vitoria do minigame em rmForestHorseII.
	// Irmao some no inicio (set_visible; "Consegui!" e pagina 0 e trigger_text nao dispara na 1a linha).
	if (cutscene_id == "floresta_cavalo2_fim") {
	    return [
	        { action: "lock_input" },
	        { action: "set_visible", target: objIrmao, value: false },
	        { action: "dialog", key: "estranho_3b" },
	        { action: "set_visible", target: objStranger, value: false },
	        { action: "set_visible", target: objVillain, value: true },
	        { action: "dialog", key: "estranho_vilao" },
	        { action: "teleport", target: "rmAnxiety", target_position: { x: 444, y: 270 } }
	    ];
	}

    show_debug_message("scrCutsceneDefinitions: cutscene_id desconhecido: " + string(cutscene_id));
    return [];
}