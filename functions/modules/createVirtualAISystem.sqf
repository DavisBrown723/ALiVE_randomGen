params [
    ["_debug", true, [true]],
    ["_persistent", false, [false]],
    ["_syncronised", "ADD", [""]],
    ["_spawnRadius", 1500, [1500]],
    ["_spawnTypeHeliRadius", 1500, [1500]],
    ["_spawnTypeJetRadius", 0, [0]],
    ["_activeLimiter", 144, [144]],
    ["_speedModifier", 1, [1]],
    ["_speedmodifierCombat", 1, [1]],
    ["_seaTransport", false, [false]],
    ["_smoothSpawn", 0.3, [0.3]]
];

private _module = ["ALiVE_sys_profile"] call ALiVE_fnc_randomGenCreateModule;

_module setvariable ["debug", str _debug];
_module setvariable ["persistent", str _persistent];
_module setvariable ["syncronised", _syncronised];
_module setvariable ["spawnRadius", str _spawnRadius];
_module setvariable ["spawnTypeHeliRadius", str _spawnTypeHeliRadius];
_module setvariable ["spawnTypeJetRadius", str _spawnTypeJetRadius];
_module setvariable ["activeLimiter", str _activeLimiter];
_module setvariable ["speedModifier", _speedModifier];
_module setvariable ["virtualcombat_speedmodifier", str _speedmodifierCombat];
_module setvariable ["seaTransport", str _seaTransport];
_module setvariable ["smoothSpawn", str _smoothSpawn];

_module setvariable ["function", missionnamespace getvariable (gettext (configfile >> "cfgvehicles" >> "ALiVE_sys_profile" >> "function"))];

_module