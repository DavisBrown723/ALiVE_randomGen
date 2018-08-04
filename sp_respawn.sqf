private _isSinglePlayer = hasInterface && isserver;

if (!_isSinglePlayer) exitwith {};


SP_respawn_active = true;
SP_respawn_spawnPos = getpos player;
SP_respawn_unitType = typeof player;
SP_respawn_unitSide = side player;

[] spawn {
    while {SP_respawn_active} do {

        waituntil {!(alive player)};

        private _corpse = player;
        private _sideUnits = allunits select {side _x == SP_respawn_unitSide};

        private "_unit";
        if (count _sideUnits > 0) then {
            private _sideUnitsSorted = [_sideUnits,[],{_x distance _corpse},"ASCEND", {leader group _x != _x && {vehicle _x == _x || driver vehicle _x != _x}}] call BIS_fnc_sortBy;

            if (count _sideUnitsSorted > 4) then {
                _sideUnitsSorted = _sideUnitsSorted select [0,5];
            };

            _unit = selectrandom _sideUnitsSorted;
        } else {
            _unit = (createGroup SP_respawn_unitSide) createunit [SP_respawn_unitType, SP_respawn_spawnPos, [], 0, "NONE"];
        };

        selectplayer _unit;

        BIS_DeathBlur ppEffectAdjust [0.0];
        BIS_DeathBlur ppEffectCommit 0.0;

        // cam effects

        private _cam = "camera" camCreate (_corpse modelToWorld [0, -1, 2]);
        _cam setDir (getdir _corpse);
        _cam cameraEffect ["Internal", "Back"];

        _cam camSetPos (_corpse modelToWorld [0, -2, 3]);
        _cam camSetTarget (_corpse modelToWorld [0,0,0.8]);
        _cam camCommit 3;

        waitUntil {camCommitted _cam};

        _cam camSetPos (_corpse modelToWorld [0, -30, 150]);
        _cam camSetDive 5;
        _cam camCommit 4;

        waitUntil {camCommitted _cam};

        sleep 1.5;
        _cam camSetTarget _unit;
        _cam camCommit 2;

        waitUntil {camCommitted _cam};

        sleep 1;
        _cam camSetPos (_unit modelToWorld [0, 0.2, 1]);
        _cam camCommit 4;

        waitUntil {camCommitted _cam};

        selectplayer _unit;
        _cam cameraEffect ["terminate", "Back"];
        camDestroy _cam;

    };
};