function scrCutsceneDefinitions(cutscene_id) {
    if (cutscene_id == "sala_professora") {
        return [
            { action: "lock_input" },
            { action: "teleport", target: "rmEscola4", target_position: { x: 375, y: 260 } },
            { action: "wait", duration: 180 },
            { action: "teleport", target: "rmWalkHome", target_position: { x: 120, y: 330 } },
            { action: "unlock_input" }
        ];
    }
	
	if (cutscene_id == "chegada_floresta") {
	    return [
	        { action: "lock_input" },
			{ action: "parallel", branches: [
			    { action: "move", target: objPlayer, target_position: { x: inst_3CAE71CC.x, y: objPlayer.y }, velocity: 2 },
			    { action: "teleport", delay: 200, target: "rmHouseLivingRoom", target_position: { x: 700, y: 250 }, fade_speed: 0.2 }
			]},
	        { action: "unlock_input" }
	    ];
	}
	
	if (cutscene_id == "chegada_casa") {
	     return [
		     { action: "lock_input" },
			 { action: "parallel", branches: [
                { action: "dialog", character: "chegada_casa" },
                { action: "sequence", trigger_text: "Que saco!", steps: [
						{ action: "move", target: objPlayer, target_position: { x: inst_2AAD1E8F.x, y: objPlayer.y }, velocity: 3.5 },
						{ action: "move", target: objPlayer, target_position: { x: inst_2AAD1E8F.x, y: inst_42A66B9B.y}, velocity: 3.5 }
                ]}
            ]},
			{ action: "teleport", delay: 200, target: "rmHouseSiblingsBedRoom", target_position: { x: 140, y: 205 } },
            { action: "unlock_input" }
		];
	}
	
    show_debug_message("scrCutsceneDefinitions: cutscene_id desconhecido: " + string(cutscene_id));
    return [];
}