params [
    ["_debug", false, [false]],
    ["_controltype", "invasion", [""]],
    ["_factions", [], [[]]],
    ["_reinforcements", 0.9, [0.9]],
    ["_roadblocks", 1, [1]],
    ["_persistent", false, [false]],
    ["_asymOccupation", -100, [-100]],
    ["_intelChance", 0, [0]],
    ["_simultanObjectives", 10, [10]],
    ["_minAgents", 2, [2]]
];

// auto calls init function if created as ALiVE_mil_opcom
private _module = ["logic"] call ALiVE_fnc_randomGenCreateModule;

_module setvariable ["debug", str _debug];
_module setvariable ["persistent", str _persistent];
_module setvariable ["controltype", _controltype];
_module setvariable ["asym_occupation", _asymOccupation];
_module setvariable ["roadblocks", _roadblocks];
_module setvariable ["reinforcements", str _reinforcements];
_module setvariable ["intelchance", _intelChance];
_module setvariable ["factions", [_factions] call ALiVE_fnc_randomGenArrayToStringList];
_module setvariable ["simultanObjectives", _simultanObjectives];
_module setvariable ["minAgents", _minAgents];

_module setvariable ["faction1", "NONE"];
_module setvariable ["faction2", "NONE"];
_module setvariable ["faction3", "NONE"];
_module setvariable ["faction4", "NONE"];

_module setvariable ["function", missionnamespace getvariable (gettext (configfile >> "cfgvehicles" >> "ALiVE_mil_opcom" >> "function"))];

_module