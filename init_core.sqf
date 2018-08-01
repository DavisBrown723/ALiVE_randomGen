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

ALiVE_fnc_randomGenArrayToStringList = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\arrayToStringList.sqf";
ALiVE_fnc_randomGenGenerateMission = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\generateMission.sqf";
ALiVE_fnc_randomGenGenerateStartPoints = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\generateStartPoints.sqf";
ALiVE_fnc_randomGenGenerateTAORMarkers = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\generateTAORMarkers.sqf";
ALiVE_fnc_randomGenGenerateTAORs = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\generateTAORs.sqf";
ALiVE_fnc_randomGenLoadAliveCore = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\loadAliveCore.sqf";
ALiVE_fnc_randomGenLoadClusters = compile preprocessFileLineNumbers "ALiVE_randomGen\functions\loadClusters.sqf";

// generate mission

call ALiVE_fnc_randomGenGenerateMission;