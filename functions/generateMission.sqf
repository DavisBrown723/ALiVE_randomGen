startLoadingScreen ["ALiVE - Randomly Generating Mission..."];
if (ALiVE_randomGen_debugEnabled) then {
    diag_log format ["ALiVE_randomGen - Starting Mission Generation"];
};


// load core modules
// ALiVE required
// Virtual AI System


[] call ALiVE_fnc_randomGenLoadALiVECore;
progressLoadingScreen 0.2;
if (ALiVE_randomGen_debugEnabled) then {
    diag_log format ["ALiVE_randomGen - ALiVE Core Loaded"];
};


// load clusters


[{
    [] call ALiVE_fnc_randomGenLoadClusters;

    progressLoadingScreen 0.4;
    if (ALiVE_randomGen_debugEnabled) then {
        diag_log format ["ALiVE_randomGen - Clusters Loaded"];
    };
}, []] call CBA_fnc_directCall;


// generate taors


private _taorData = [{
    private _startPoints = [] call ALiVE_fnc_randomGenGenerateStartPoints;
    private _taors = [_startPoints] call ALiVE_fnc_randomGenGenerateTAORs;
    private _taorMarkers = [_taors] call ALiVE_fnc_randomGengenerateTAORMarkers;

    progressLoadingScreen 0.5;
    if (ALiVE_randomGen_debugEnabled) then {
        diag_log format ["ALiVE_randomGen - Generating Start Points and TAOR"];
    };

    [_startPoints,_taors,_taorMarkers]
}, []] call CBA_fnc_directCall;


// create placement modules


private _placementModules = [{
    _taorMarkers = _taorData select 2;

    _taorMarkers params ["_taorList1","_taorList2"];

    private _milPlacement1 = [false, _taorList1, [], 100, 0, true, "BLU_F", 400, "Random", true, true, true, true, 0.5, "None", 0.75] call ALiVE_fnc_randomGenCreateMilPlacement;
    private _milPlacement2 = [false, _taorList2, [], 100, 0, true, "OPF_F", 400, "Random", true, true, true, true, 0.5, "None", 0.75] call ALiVE_fnc_randomGenCreateMilPlacement;

    [_milPlacement1, true] call ALiVE_fnc_randomGenInitModule;
    [_milPlacement2, true] call ALiVE_fnc_randomGenInitModule;

    private _civPlacement1 = [false, _taorList1, [], "ALL", 250, 0, true, "BLU_F", 400, "Random", true, true, true, true, 0.5, "None", 0.75, 0, 1] call ALiVE_fnc_randomGenCreateCivPlacement;
    private _civPlacement2 = [false, _taorList2, [], "ALL", 250, 0, true, "OPF_F", 400, "Random", true, true, true, true, 0.5, "None", 0.75, 0, 1] call ALiVE_fnc_randomGenCreateCivPlacement;

    [_civPlacement1, true] call ALiVE_fnc_randomGenInitModule;
    [_civPlacement2, true] call ALiVE_fnc_randomGenInitModule;

    if (ALiVE_randomGen_debugEnabled) then {
        //{_x setmarkeralpha 0.3} foreach _taorList1;
        //{_x setmarkeralpha 0.3} foreach _taorList2;

        diag_log format ["ALiVE_randomGen - Placement Modules Created"];
    };

    progressLoadingScreen 0.7;

    [[_civPlacement1,_milPlacement1],[_civPlacement2,_milPlacement2]]
}, []] call CBA_fnc_directCall;


// create opcoms


_placementModules params ["_placementModulesTeam1","_placementModulesTeam2"];

private _allPlacementModules = _placementModulesTeam1 + _placementModulesTeam2;

private _opcom1 = [ALiVE_randomGen_debugEnabled, "invasion", ["BLU_F"]] call ALiVE_fnc_randomGenCreateOPCOM;
[_opcom1, _allPlacementModules] call ALiVE_fnc_randomGenSyncToModule;

private _opcom2 = [ALiVE_randomGen_debugEnabled, "invasion", ["OPF_F"]] call ALiVE_fnc_randomGenCreateOPCOM;
[_opcom2, _allPlacementModules] call ALiVE_fnc_randomGenSyncToModule;

[_opcom1] call ALiVE_fnc_randomGenInitModule;
[_opcom2] call ALiVE_fnc_randomGenInitModule;

waituntil {(_opcom1 getvariable ["startupComplete", false]) && (_opcom2 getvariable ["startupComplete", false])};


// create C2ISTAR

private _c2istar = [
    ALiVE_randomGen_debugEnabled, "ItemRadio", false,
    "Strategic", "BLU_F","OPF_F",
    "None","OPF_F","BLU_F",
    "None","IND_F","OPF_F",
    "SIDE","SIDE", false, false,
    "SIDE", true, 1, true, 2000, true, "NONE", false, 0.5
] call ALiVE_fnc_randomGenCreateC2ISTAR;

[_c2istar] call ALiVE_fnc_randomGenInitModule;


if (ALiVE_randomGen_debugEnabled) then {
    diag_log format ["ALiVE_randomGen - Mission Generation Complete"];
};
endLoadingScreen;