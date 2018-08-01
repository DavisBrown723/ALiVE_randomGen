params ["_taorList"];

private _taorString = "";
{
    if (_foreachindex != 0) then {
        _taorString = _taorString + "," + _x;
    } else {
        _taorString = _taorString + _x;
    };
} foreach _taorList;

_taorString