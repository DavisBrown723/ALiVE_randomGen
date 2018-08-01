private _requiredModule = [ALiVE_randomGen_debugEnabled] call ALiVE_fnc_randomGenCreateRequired;
private _virtualAISystem = [ALiVE_randomGen_debugEnabled] call ALiVE_fnc_randomGenCreateVirtualAISystem;

[_requiredModule] call ALiVE_fnc_randomGenInitModule;
[_virtualAISystem] call ALiVE_fnc_randomGenInitModule;

waituntil {!isnil "ALiVE_REQUIRE_INITIALISED"};
waituntil {!isnil "ALiVE_profileSystemInit"};