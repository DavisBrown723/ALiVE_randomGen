// init SQF++
[{
    call compile preprocessFileLineNumbers "SQF++\init.sqf";
}] call CBA_fnc_directCall;

// init sp respawn for singleplayer
execvm "sp_respawn.sqf";

// initialize ALiVE random gen mission
[true,"BLU_F","OPF_F"] call compile preprocessFileLineNumbers "ALiVE_randomGen\init_core.sqf";