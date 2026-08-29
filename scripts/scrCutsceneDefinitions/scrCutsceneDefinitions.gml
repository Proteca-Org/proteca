function scrCutsceneDefinitions(cutscene_id) {
		
    if (cutscene_id == "sala_professora") {
        return [
            { action: "lock_input" },
            { action: "teleport", target: "rmEscola4", target_position: { x: 375, y: 260 } },
            { action: "wait", duration: 180 },
            { action: "teleport", target: "rmWalkHome", target_position: { x: 120, y: 330 } },
            
			{ action: "call_cutscene", cutscene_id: "chegada_floresta" }
        ];
    }
	
	if (cutscene_id == "chegada_floresta") {
	    return [
			{ action: "parallel", branches: [
			    { action: "move", target: objPlayer, target_position: { x: inst_3CAE71CC.x, y: objPlayer.y }, velocity: 2 },
			    { action: "teleport", delay: 200, target: "rmHouseLivingRoom", target_position: { x: 700, y: 250 }, fade_speed: 0.2 }
			]},
	        
			{ action: "call_cutscene", cutscene_id: "chegada_casa" }
	    ];
	}
	
	if (cutscene_id == "chegada_casa") {
	     return [
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
	        { action: "set_visible", target: objIrmao, value: true },
        
	        // PARA DEBUG: colocar expressão triste (é setada no minigame)
	        { action: "set_face", target: objIrmao, value: 2 },

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
    
	        { action: "teleport", target: "rmHouseLivingRoom", target_position: { x: 222, y: 240 } },
	        { action: "set_visible", target: objPlayer, value: true },
        
	        { action: "unlock_input" }
	        // TODO prox cena
	    ];
	}

    show_debug_message("scrCutsceneDefinitions: cutscene_id desconhecido: " + string(cutscene_id));
    return [];
}