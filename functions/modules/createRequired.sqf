params [
    ["_debug", false, [false]],
    ["_versioning", "warning", [""]],
    ["_aiDistribution", false, [false]],
    ["_disableSave", true, [true]],
    ["_disableMarkers", false, [false]],
    ["_disableAdminActions", false, [false]],
    ["_pauseModules", false, [false]],
    ["_gcInterval", 300, [300]],
    ["_gcThreshold", 100, [100]],
    ["_gcIndividualTypes", [], [[]]],
    ["_tabletModel", "Tablet01", [""]]
];

private _module = ["ALiVE_require"] call ALiVE_fnc_randomGenCreateModule;

_module setvariable ["debug", str _debug];
_module setvariable ["ALiVE_Versioning", _versioning];
_module setvariable ["ALiVE_AI_DISTRIBUTION", str _aiDistribution];
_module setvariable ["ALiVE_DISABLESAVE", str _disableSave];
_module setvariable ["ALiVE_DISABLEMARKERS", _disableMarkers];
_module setvariable ["ALiVE_DISABLEADMINACTIONS", _disableAdminActions];
_module setvariable ["ALiVE_PAUSEMODULES", _pauseModules];
_module setvariable ["ALiVE_GC_INTERVAL", str _gcInterval];
_module setvariable ["ALiVE_GC_THRESHHOLD", str _gcThreshold];
_module setvariable ["ALiVE_GC_INDIVIDUALTYPES", str _gcIndividualTypes];
_module setvariable ["ALiVE_TABLET_MODEL", _tabletModel];

_module setvariable ["function", missionnamespace getvariable (gettext (configfile >> "cfgvehicles" >> "ALiVE_require" >> "function"))];

_module