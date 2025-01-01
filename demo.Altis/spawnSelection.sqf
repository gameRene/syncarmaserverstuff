// Marker für Spawnpunkte
private _spawnPoints = [
"    ["spawn1", "spawn1"],
    ["spawn2", "spawn2"],
    ["spawn3", "spawn3"]"
];

// Spieler zur Kartenauswahl zwingen
waitUntil { !isNull findDisplay 12 }; // Wartet, bis die Kartenansicht geöffnet ist

// Dialog zur Auswahl der Spawnpunkte
private _dialog = ["spawn1", "spawn2", "spawn3"];


private _selection = ["Bitte wählen Sie einen Spawnpunkt:", _dialog] call BIS_fnc_guiMessage;
if (isNil "_selection") exitWith {endMission "END1"}; // Spieler hat Auswahl abgebrochen

// Position basierend auf Auswahl setzen
private _chosenSpawn = _spawnPoints select _selection;
private _markerPos = getMarkerPos (_chosenSpawn select 0);

player setPos _markerPos;
player setDir (random 360); // Zufällige Blickrichtung
