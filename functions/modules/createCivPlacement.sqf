params [
    ["_debug", false, [false]],
    ["_taor", [], [[]]],
    ["_blacklist", [], [[]]],
    ["_clusterType", "ALL", [""]],
    ["_sizeFilter", 250, [250]],
    ["_priorityFilter", 0, [0]],
    ["_withPlacement", true, [true]],
    ["_faction", "", [""]],
    ["_size", 200, [200]],
    ["_type", "Random", [""]],
    ["_createHQ", true, [true]],
    ["_createFieldHQ", true, [true]],
    ["_placeHelis", true, [true]],
    ["_placeSupplies", true, [true]],
    ["_ambientVehicleAmount", 0.6, [0.6]],
    ["_randomcamps", "None", [""]],
    ["_readinessLevel", 1, [1]],
    ["_roadblocks", 0, [0]],
    ["_placeSeaPatrols", 0, [0]],
    ["_customInfantryCount", "", [""]],
    ["_customMotorisedCount", "", [""]],
    ["_customMechanisedCount", "", [""]],
    ["_customArmourCount", "", [""]],
    ["_customSpecOpsCount", "", [""]]
];

private _module = ["ALiVE_civ_placement"] call ALiVE_fnc_randomGenCreateModule;

_module setvariable ["debug", _debug];
_module setvariable ["taor", [_taor] call ALiVE_fnc_randomGenArrayToStringList];
_module setvariable ["blacklist", [_blacklist] call ALiVE_fnc_randomGenArrayToStringList];
_module setvariable ["clusterType", _clusterType];
_module setvariable ["sizeFilter", str _sizeFilter];
_module setvariable ["priorityFilter", str _priorityFilter];
_module setvariable ["withPlacement", str _withPlacement];
_module setvariable ["size", _size];
_module setvariable ["type", _type];
_module setvariable ["randomcamps", _randomcamps];
_module setvariable ["readinessLevel", str _readinessLevel];
_module setvariable ["roadblocks", str _roadblocks];
_module setvariable ["placeSeaPatrols", _placeSeaPatrols];
_module setvariable ["customInfantryCount", _customInfantryCount];
_module setvariable ["customMotorisedCount", _customMotorisedCount];
_module setvariable ["customMechanisedCount", _customMechanisedCount];
_module setvariable ["customArmourCount", _customArmourCount];
_module setvariable ["customSpecOpsCount", _customSpecOpsCount];
_module setvariable ["faction", _faction];
_module setvariable ["createHQ", _createHQ];
_module setvariable ["createFieldHQ", _createFieldHQ];
_module setvariable ["placeHelis", _placeHelis];
_module setvariable ["placeSupplies", _placeSupplies];
_module setvariable ["ambientVehicleAmount", _ambientVehicleAmount];

_module setvariable ["function", missionnamespace getvariable (gettext (configfile >> "cfgvehicles" >> "ALiVE_civ_placement" >> "function"))];

_module