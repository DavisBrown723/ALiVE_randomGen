params [
    ["_debugEnabled", false, [false]]
];

if (!isnil "ALiVE_randomGenCoreInitStarted" && {!ALiVE_randomGenCoreInitStarted}) exitwith {
    diag_log format ["ALiVE - Random Mission Generation Already In Progress, Core-Init Aborted"];
};

ALiVE_randomGenCoreInitStarted = true;

ALiVE_randomGen_debugEnabled = _debugEnabled;

// load functions

ALiVE_fnc_randomGenCreateC2ISTAR = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createC2ISTAR.sqf";
ALiVE_fnc_randomGenCreateCivPlacement = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createCivPlacement.sqf";
ALiVE_fnc_randomGenCreateMilPlacement = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createMilPlacement.sqf";
ALiVE_fnc_randomGenCreateModule = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createModule.sqf";
ALiVE_fnc_randomGenCreateOPCOM = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createOPCOM.sqf";
ALiVE_fnc_randomGenCreateRequired = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createRequired.sqf";
ALiVE_fnc_randomGenCreateVirtualAISystem = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\createVirtualAISystem.sqf";
ALiVE_fnc_randomGenInitModule = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\initModule.sqf";
ALiVE_fnc_randomGenSyncToModule = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\modules\syncToModule.sqf";

ALiVE_fnc_randomGenArrayToStringList = ["ALiVE_randomGen\functions\arrayToStringList.sqf++"] call generateCode;
ALiVE_fnc_randomGenGenerateMission = ["ALiVE_randomGen\functions\generateMission.sqf++"] call generateCode;
ALiVE_fnc_randomGenGenerateStartPoints = ["ALiVE_randomGen\functions\generateStartPoints.sqf++"] call generateCode;
ALiVE_fnc_randomGenGenerateTAORMarkers = ["ALiVE_randomGen\functions\generateTAORMarkers.sqf++"] call generateCode;
ALiVE_fnc_randomGenGenerateTAORs = ["ALiVE_randomGen\functions\generateTAORs.sqf++"] call generateCode;
ALiVE_fnc_randomGenLoadAliveCore = ["ALiVE_randomGen\functions\loadAliveCore.sqf++"] call generateCode;
ALiVE_fnc_randomGenLoadClusters = ["ALiVE_randomGen\functions\loadClusters.sqf++"] call generateCode;

// generate mission

call ALiVE_fnc_randomGenGenerateMission;