function scrCutsceneDefinitions(cutscene_id) {
    if (cutscene_id == "sala_professora") {
        return [
            { action: "lock_input" },
            { action: "teleport", target: "rmEscola4", target_position: { x: 375, y: 260 } },
            { action: "wait", duration: 180 },
            { action: "teleport", target: "rmFloresta", target_position: { x: 120, y: 330 } },
            { action: "unlock_input" }
        ];
    }
	
	if (cutscene_id == "chegada_floresta") {
	    return [
	        { action: "lock_input" },
	        { action: "move", target: objPlayer, direction: 1, speed: 1, duration: 360 },
	        { action: "teleport", target: "rmHouseLivingRoom", target_position: { x: 700, y: 265 } },
	        { action: "unlock_input" }
	    ];
	}
	
	if (cutscene_id == "chegada_casa") {
      return [
      ];
	}
	
    show_debug_message("scrCutsceneDefinitions: cutscene_id desconhecido: " + string(cutscene_id));
    return [];
}