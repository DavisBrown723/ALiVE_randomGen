params ["_taors"];

_taors params ["_startPoint1","_startPoint2"];


// flood fill to find taors
// oscillate between each start point
// for fair sector distribution

private _teamOneSectors = [_startPoint1];
private _teamTwoSectors = [_startPoint2];

private _teamOneBorderSectors = [_startPoint1];
private _teamTwoBorderSectors = [_startPoint2];

private _allSectors = +([ALiVE_sectorGrid,"sectors"] call ALIVE_fnc_sectorGrid);
//private _landSectors = [_allSectors,"SEA"] call ALIVE_fnc_sectorFilterTerrain;

private _openSectorIDs = _allSectors apply {[_x,"id"] call ALiVE_fnc_hashGet};

while {!(_openSectorIDs isEqualTo [])} do {

    // grab sector for team one
    if !(_teamOneBorderSectors isEqualTo []) then {
        private _targetSector = _teamOneBorderSectors deleteat 0;

        private _surroundingSectors = [ALiVE_sectorGrid,"surroundingSectors", ([_targetSector,"position"] call ALiVE_fnc_hashGet)] call ALIVE_fnc_sectorGrid;
        _surroundingSectors = _surroundingSectors select { ([_x,"id"] call ALiVE_fnc_hashGet) in _openSectorIDs };

        _teamOneBorderSectors append _surroundingSectors;

        if !(_surroundingSectors isEqualTo []) then {
            private _sectorToAdd = _surroundingSectors select 0;
            _teamOneSectors pushback _sectorToAdd;

            private _removedSectorIndex = _openSectorIDs find ([_sectorToAdd,"id"] call ALiVE_fnc_hashGet);
            _openSectorIDs deleteat _removedSectorIndex;
        };
    };

    // grab sector for team two
    if !(_teamTwoBorderSectors isEqualTo []) then {
        private _targetSector = _teamTwoBorderSectors deleteat 0;

        private _surroundingSectors = [ALiVE_sectorGrid,"surroundingSectors", ([_targetSector,"position"] call ALiVE_fnc_hashGet)] call ALIVE_fnc_sectorGrid;
        _surroundingSectors = _surroundingSectors select { ([_x,"id"] call ALiVE_fnc_hashGet) in _openSectorIDs };

        _teamTwoBorderSectors append _surroundingSectors;

        if !(_surroundingSectors isEqualTo []) then {
            private _sectorToAdd = _surroundingSectors select 0;
            _teamTwoSectors pushback _sectorToAdd;

            private _removedSectorIndex = _openSectorIDs find ([_sectorToAdd,"id"] call ALiVE_fnc_hashGet);
            _openSectorIDs deleteat _removedSectorIndex;
        };
    };

};

[_teamOneSectors,_teamTwoSectors]