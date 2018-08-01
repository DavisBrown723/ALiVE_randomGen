params ["_taors"];

_taors params ["_taorSectors1","_taorSectors2"];

private _teamOneTAOR = [];
{
    private _id = format ["ALiVE_randomGen_%1_taorMarker", ([_x,"id"] call ALiVE_fnc_hashGet)];
    private _pos = [_x,"position"] call ALiVE_fnc_hashGet;
    private _dimensions = [_x,"dimensions"] call ALiVE_fnc_hashGet;

    private _m = createMarker [_id, _pos];
    _m setMarkerShape "RECTANGLE";
    _m setMarkerSize _dimensions;
    _m setMarkerColor "ColorBlue";
    _m setMarkerAlpha 0.3;

    _teamOneTAOR pushback _m;
} foreach _taorSectors1;

private _teamTwoTAOR = [];
{
    private _id = format ["ALiVE_randomGen_%1_taorMarker", ([_x,"id"] call ALiVE_fnc_hashGet)];
    private _pos = [_x,"position"] call ALiVE_fnc_hashGet;
    private _dimensions = [_x,"dimensions"] call ALiVE_fnc_hashGet;

    private _m = createMarker [_id, _pos];
    _m setMarkerShape "RECTANGLE";
    _m setMarkerSize _dimensions;
    _m setMarkerColor "ColorRed";
    _m setMarkerAlpha 0.3;

    _teamTwoTAOR pushback _m;
} foreach _taorSectors2;

[_teamOneTAOR,_teamTwoTAOR]