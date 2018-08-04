params [
    ["_debugEnabled", false, [false]],
    ["_faction1", "BLU_F", [""]],
    ["_faction2", "OPF_F", [""]]
];

if (!isserver) exitwith {};

if (!isnil "ALiVE_randomGenCoreInitStarted" && {!ALiVE_randomGenCoreInitStarted}) exitwith {
    diag_log format ["ALiVE - Random Mission Generation Already In Progress, Core-Init Aborted"];
};

ALiVE_randomGenCoreInitStarted = true;

ALiVE_randomGen_debugEnabled = _debugEnabled;

// load classes

call (["ALiVE_randomGen\classes\module.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\garbage_collector.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_required.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_sys_profile.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_mil_placement.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_civ_placement.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_mil_opcom.sqf++"] call generateCode);
call (["ALiVE_randomGen\classes\alive_mil_c2istar.sqf++"] call generateCode);

// load functions

ALiVE_arrayToStringList = ["ALiVE_randomGen\functions\arrayToStringList.sqf++"] call generateCode;
ALiVE_randomGenGenerateMission = ["ALiVE_randomGen\functions\generateMission.sqf++"] call generateCode;
ALiVE_randomGenGenerateStartPoints = ["ALiVE_randomGen\functions\generateStartPoints.sqf++"] call generateCode;
ALiVE_randomGenGenerateTAORMarkers = ["ALiVE_randomGen\functions\generateTAORMarkers.sqf++"] call generateCode;
ALiVE_randomGenGenerateTAORs = ["ALiVE_randomGen\functions\generateTAORs.sqf++"] call generateCode;
ALiVE_randomGenLoadAliveCore = ["ALiVE_randomGen\functions\loadAliveCore.sqf++"] call generateCode;
ALiVE_randomGenLoadClusters = ["ALiVE_randomGen\functions\loadClusters.sqf++"] call generateCode;

// generate mission

[_faction1,_faction2] call ALiVE_randomGenGenerateMission;