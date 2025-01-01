// Marker für Spawnpunkte
private _spawnPoints = [
    ["marker_west", "Stadtzentrum"],
    ["marker_east", "Hafen"]
];

// Spieler zur Kartenauswahl zwingen
waitUntil { !isNull findDisplay 12 }; // Wartet, bis die Kartenansicht geöffnet ist

// Dialog zur Auswahl der Spawnpunkte
private _dialog = [];
{
    _dialog pushBack format ["%1 - %2", _x select 0, _x select 1];
} forEach _spawnPoints;

private _selection = ["Bitte wählen Sie einen Spawnpunkt:", _dialog] call BIS_fnc_guiMessage;
if (isNil "_selection") exitWith {endMission "END1"}; // Spieler hat Auswahl abgebrochen

// Position basierend auf Auswahl setzen
private _chosenSpawn = _spawnPoints select _selection;
private _markerPos = getMarkerPos (_chosenSpawn select 0);

player setPos _markerPos;
player setDir (random 360); // Zufällige Blickrichtung
