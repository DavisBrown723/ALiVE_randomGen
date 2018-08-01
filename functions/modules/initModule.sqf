params [
    "_module",
    ["_unscheduled", false, [false]]
];

private _function = _module getvariable ["function",{}];

if (_unscheduled) then {
    [_function, [_module,[]]] call CBA_fnc_directCall;
} else {
    [_module,[]] spawn _function;
};