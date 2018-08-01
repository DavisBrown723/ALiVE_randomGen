// start each taor on a military sector

private _milSectors = (ALIVE_clustersMil select 2) apply {
    [ALiVE_sectorGrid,"positionToSector", ([_x,"center"] call ALiVE_fnc_hashGet)] call ALIVE_fnc_sectorGrid;
};

// select two starting points
// first is random
// second is far away from the first

private _startPoint1 = selectrandom _milSectors;
private _startPointPos1 = [_startPoint1,"position"] call ALiVE_fnc_hashGet;

private _sectorsByDistance = [_milSectors, [], { _startPointPos1 distance2D ([_x,"position"] call ALiVE_fnc_hashGet) }, "DESCEND"] call BIS_fnc_sortBy;
private _sectorCount = count _sectorsByDistance;

// select second point
// should not (always) be the furthest sector
// add range to give some flavor to the generation

private _startPoint2 = _sectorsByDistance select (round (random [
    0,
    _sectorCount / 3,
    2 * (_sectorCount / 3)
]));
private _startPointPos2 = [_startPoint2,"position"] call ALiVE_fnc_hashGet;


if (ALiVE_randomGen_debugEnabled) then {
    private _startingPointOneID = format ["ALiVE_randomGen_startingPoint-%1", ([_startPoint1,"id"] call ALiVE_fnc_hashGet)];
    private _m = createMarker [_startingPointOneID,_startPointPos1];
    _m setMarkerShape "ICON";
    _m setMarkerType "hd_dot";
    _m setMarkerSize [1.5,1.5];
    _m setMarkerColor "ColorBlue";

    private _startingPointTwoID = format ["ALiVE_randomGen_startingPoint-%1", ([_startPoint2,"id"] call ALiVE_fnc_hashGet)];
    private _m = createMarker [_startingPointTwoID,_startPointPos2];
    _m setMarkerShape "ICON";
    _m setMarkerType "hd_dot";
    _m setMarkerSize [1.5,1.5];
    _m setMarkerColor "ColorRed";
};

[_startPoint1,_startPoint2]