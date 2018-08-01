// load mil clusters

if (isnil "ALiVE_clustersMil" && isnil "ALiVE_loadedMilClusters") then {
    private _worldName = tolower worldname;
    private _file = format ["x\alive\addons\mil_placement\clusters\clusters.%1_mil.sqf", _worldName];
    call compile preprocessFileLineNumbers _file;
    ALiVE_loadedMilClusters = true;
};

// load civ clusters

if(isnil "ALiVE_clustersCiv" && isnil "ALiVE_loadedCivClusters") then {
    private _worldName = tolower worldname;
    private _file = format["x\alive\addons\civ_placement\clusters\clusters.%1_civ.sqf", _worldName];
    call compile preprocessFileLineNumbers _file;
    ALiVE_loadedCivClusters = true;
};