if (instance_number(objMissionManager) > 1) {
    instance_destroy();
    exit;
}

global.missions = [
    { id: 0, flag: "flag_backpack_found", text: "Minha mochila sumiu... preciso procurá-la.", done: false },
    { id: 1, flag: "flag_brother_found",  text: "Preciso encontrar {sibling:o_meu_irmao} para irmos pra casa.", done: false },
];
global.current_mission = 0;