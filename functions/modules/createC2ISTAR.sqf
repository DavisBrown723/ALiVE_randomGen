params [
    ["_debug", false, [false]],
    ["_c2Item", "LaserDesignator", [""]],
    ["_persistent", false, [false]],
    ["_autoGenBlufor", "None", [""]],
    ["_autoGenBluforFaction", "BLU_F", [""]],
    ["_autoGenBluforEnemyFaction", "OPF_F", [""]],
    ["_autoGenOpfor", "None", [""]],
    ["_autoGenOpforFaction", "OPF_F", [""]],
    ["_autoGenOpforEnemyFaction", "BLU_F", [""]],
    ["_autoGenIndfor", "None", [""]],
    ["_autoGenIndforFaction", "IND_F", [""]],
    ["_autoGenIndforEnemyFaction", "OPF_F", [""]],
    ["_gmLimit", "SIDE", [""]],
    ["_scomOpsLimit", "SIDE", ["SIDE"]],
    ["_scomOpsAllowSpectate", true, [true]],
    ["_scomOpsAllowInstantJoin", true, [true]],
    ["_scomIntelLimit", "SIDE", [""]],
    ["_displayIntel", false, [false]],
    ["_intelChance", 1, [1]],
    ["_friendlyIntel", false, [false]],
    ["_friendlyIntelRadius", 2000, [2000]],
    ["_displayMilitarySectors", false, [false]],
    ["_displayTraceGrid", "NONE", [""]],
    ["_displayPlayerSectors", false, [false]],
    ["_runEvery", 2, [2]]
];

// auto calls init function if created as ALiVE_mil_c2istar
private _module = ["logic"] call ALiVE_fnc_randomGenCreateModule;

_module setvariable ["debug", _debug];
_module setvariable ["c2_item", _c2Item];
_module setvariable ["persistent", _persistent];
_module setvariable ["autoGenerateBlufor", _autoGenBlufor];
_module setvariable ["autoGenerateBluforFaction", _autoGenBluforFaction];
_module setvariable ["autoGenerateBluforEnemyFaction", _autoGenBluforEnemyFaction];
_module setvariable ["autoGenerateOpfor", _autoGenOpfor];
_module setvariable ["autoGenerateOpforFaction", _autoGenOpforFaction];
_module setvariable ["autoGenerateOpforEnemyFaction", _autoGenOpforEnemyFaction];
_module setvariable ["autoGenerateIndfor", _autoGenIndfor];
_module setvariable ["autoGenerateIndforFaction", _autoGenIndforFaction];
_module setvariable ["autoGenerateIndforEnemyFaction", _autoGenIndforEnemyFaction];
_module setvariable ["gmLimit", _gmLimit];
_module setvariable ["scomOpsLimit", _scomOpsLimit];
_module setvariable ["scomOpsAllowSpectate", _scomOpsAllowSpectate];
_module setvariable ["scomOpsAllowInstantJoin", _scomOpsAllowInstantJoin];
_module setvariable ["scomIntelLimit", _scomIntelLimit];
_module setvariable ["displayIntel", _displayIntel];
_module setvariable ["intelChance", str _intelChance];
_module setvariable ["friendlyIntel", _friendlyIntel];
_module setvariable ["friendlyIntelRadius", _friendlyIntelRadius];
_module setvariable ["displayMilitarySectors", _displayMilitarySectors];
_module setvariable ["displayTraceGrid", _displayTraceGrid];
_module setvariable ["displayPlayerSectors", _displayPlayerSectors];
_module setvariable ["runEvery", _runEvery];

_module setvariable ["function", missionnamespace getvariable (gettext (configfile >> "cfgvehicles" >> "ALiVE_mil_c2istar" >> "function"))];

_module