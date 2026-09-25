// @description Processa um step (ou branch de parallel) de uma cutscene.
//
// Toda action nova precisa seguir esta regra:
//   - retornar false enquanto ainda está rodando
//   - retornar true UMA VEZ, no frame em que termina
// O controller (objCutsceneController) só avança a queue quando recebe "true".

function scrCutsceneProcessStep(step) {
    switch (step.action) {

        case "lock_input":
            global.cutscene = true;
            return true;

        case "unlock_input":
            global.cutscene = false;
            return true;
			
		case "call_cutscene":
		    if (!variable_struct_exists(step, "triggered")) {
		        step.triggered = true;
		        scrCutsceneRun(scrCutsceneDefinitions(step.cutscene_id));
		    }
		    return false;
			
		case "set_visible":
		    step.target.visible = step.value;
		    return true;
			
		case "set_face":
		    step.target.face = step.value;
		    return true;
			
        case "wait":
			// variable_struct_exists é o "isso já foi inicializado?" padrão
            if (!variable_struct_exists(step, "waitTimer")) {
                step.waitTimer = step.duration;
            }
            step.waitTimer--;
            return (step.waitTimer <= 0);

		case "teleport":
			// Cria o objFade, que atualmente lida com o teleporte
		    if (!variable_struct_exists(step, "fadeInstance")) {
		        var pos = step.target_position;

		        var fade = instance_create_depth(0, 0, -9999, objFade);
		        fade.target_room = asset_get_index(step.target);
				
		        fade.target_x = pos.x;
		        fade.target_y = pos.y;
				
		        if (variable_struct_exists(step, "fade_speed")) {
		            fade.image_speed = step.fade_speed;
		        }
		        step.fadeInstance = fade;
		    }
			// retorna quando o objFade não existe mais (se destrói sozinho ao trocar de sala)
		    return !instance_exists(step.fadeInstance);

		case "move":
			// inicialização: Guarda velocidade original (para restaurar depois)
			// e define para onde deve andar
		    if (!variable_struct_exists(step, "moveInitialized")) {
		        step.moveInitialized = true;
		        step.originalVelocity = step.target.velocity;
		        step.target.velocity = step.velocity;
				// Podem ser valores literais ou posição de instância por referência
				// ex: { x: 780, y: inst_3CAE71CC.y }
		        step.target.targetX = step.target_position.x;
		        step.target.targetY = step.target_position.y;
				
		        var dist = point_distance(step.target.x, step.target.y, step.target_position.x, step.target_position.y);
				
				// Timeout de segurança para evitar que a cutscene trave se o alvo ficar preso.
		        step.timeoutTimer = ceil(dist/step.velocity) + 30;
		    }

		    step.timeoutTimer--;
		    var remaining = point_distance(step.target.x, step.target.y, step.target_position.x, step.target_position.y);

		    if (remaining <= CUTSCENE_ARRIVAL_TOLERANCE || step.timeoutTimer <= 0) {
		        step.target.velocity = step.originalVelocity;
		        return true;
		    }
		    return false;

		case "parallel":
		    // Roda vários steps ("branches") ao mesmo tempo. Cada branch
        // é só um step normal (move, teleport, wait, etc)
			  // branchDone rastreia quais já terminaram, p/ evitar reprocessamento
            if (!variable_struct_exists(step, "branchDone")) {
                step.branchDone = array_create(array_length(step.branches), false);
            }

            var allDone = true;
            for (var i = 0; i < array_length(step.branches); i++) {
                if (step.branchDone[i]) continue;

                var branch = step.branches[i];

				// delay opcional: branch só começa a rodar de fato depois de N frames.
                if (variable_struct_exists(branch, "delay")) {
                    if (!variable_struct_exists(branch, "delayTimer")) {
                        branch.delayTimer = branch.delay;
                    }
                    if (branch.delayTimer > 0) {
                        branch.delayTimer--;
                        allDone = false;
                        continue;
                    }
                }

                if (scrCutsceneProcessStep(branch)) {
                    step.branchDone[i] = true;
                } else {
                    allDone = false;
                }
            }
            return allDone;
			
		case "dialog":
            // inicialização: cria a caixa de diálogo com o key indicado
            if (!variable_struct_exists(step, "dialogInstance")) {
                var d = instance_create_depth(0, 0, -9999, objDialog);
                d.objectName = step.key;
                step.dialogInstance = d;
            }
            // termina quando o objDialog não existe mais (jogador clicou na última página)
            return !instance_exists(step.dialogInstance);
			 
		 case "sequence":
		     // Inicializa a sequência
		     if (!variable_struct_exists(step, "sequenceStarted")) {
		         step.sequenceStarted = false;
		         step.sequenceIndex = 0;
		     }

			 if (!step.sequenceStarted) {
			     // Se houver uma fala configurada, espera por ela
			     if (variable_struct_exists(step, "trigger_text")) {
			         if (!instance_exists(objDialog)) {
			             return false;
			         }

			         var dialogInstance = instance_find(objDialog, 0);
			         if (dialogInstance.currentSpeechText != step.trigger_text) {
			             return false;
			         }
			     }
			     step.sequenceStarted = true;
		     }

		     // Verifica se terminou todos os steps
		     if (step.sequenceIndex >= array_length(step.steps)) {
		         return true;
		     }

		     // Executa o step atual
		     var currentStep = step.steps[step.sequenceIndex];

		     if (scrCutsceneProcessStep(currentStep)) {
		         step.sequenceIndex++;
				 
				 if (step.sequenceIndex >= array_length(step.steps)) {
                     return true;
                 }
		     }
		     return false;
    }

    show_debug_message("scrCutsceneProcessStep: ação desconhecida: " + string(step.action));
    return true;
}