if (hasInterface) then {
    // Definiere die Marker und ihre Beschreibungen
    private _spawnPoints = [
        ["spawn1", "Stadtzentrum"],
        ["spawn2", "Hafen"]
    ];

    // Variable zum Speichern der Auswahl
    spawnSelected = -1;

    // Warten, bis die Kartendarstellung geöffnet ist
    waitUntil { !isNull findDisplay 12 };

    // Öffne den Dialog zur Spawnpunkt-Auswahl
    createDialog "RscDisplaySpawnSelection";

    // Warte auf die Auswahl des Spielers
    waitUntil { spawnSelected >= 0 };

    // Position basierend auf Auswahl setzen
    private _chosenSpawn = _spawnPoints select spawnSelected;
    private _markerPos = getMarkerPos (_chosenSpawn select 0);

    player setPos _markerPos; // Spieler an die ausgewählte Position setzen
    player setDir (random 360); // Zufällige Richtung
    hint format ["Sie wurden bei %1 gespawnt!", _chosenSpawn select 1];
};
