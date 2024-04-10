Date: 2010-06-13
Title: GPS Tagging für Bilder auf dem HTC HD2 aktivieren
Comments: true
Tags: Windows Mobile

<a href="https://www.flickr.com/groups/mobilecitywalkzuerich/pool/map?mode=group"><img alt="flickr GPS Karte"
        src="/assets/images/flickr_gps_map.png" /></a>
<p>Beim <a href="https://www.pixelfreund.ch/2010/04/mobile-city-walk-zuerich/">Mobile City Walk Zürich</a> (<a
        href="https://www.flickr.com/groups/mobilecitywalkzuerich/">flickr Gruppe</a>) von Gestern war eine der
    Anforderungen, dass die Bilder mit GPS Daten versehen, hochgeladen werden. GPS Tagging mag bei anderen Smartphones
    Standard sein, leider nicht so bei meinem Modell dem HTC HD2, was auf Windows Mobile 6.5 basiert.</p>
<p>Um dennoch die Bilder mit GPS Informationen in den EXIF Daten zu versehen muss eine kleine Registry Änderung auf dem
    Smartphone vollzogen werden. Dafür wird <a href="https://ceregeditor.mdsoft.pl">CERegEdit</a> gebraucht, was nicht
    Open Source, jedoch gratis erhältlich ist. <br />Nach dem herunterladen und installieren von CERegEdit, wird das
    Smartphone per ActiveSync mit dem Computer verbunden und CERegEdit gestartet. Auf Windows Vista oder Windows 7
    sollte CERegEdit unbedingt mit Administrator Rechten gestartet werden, da die Applikation ansonsten nicht richtig
    funktioniert. </p> <img alt="htc_camera_app" src="/assets/images/htc_camera_app.jpg" />
<p>Anschliessend nun die Schritte um GPS Tagging für Bilder zu aktivieren.</p>
<ol>
    <li>Wähle in CERegEdit links oben <strong>Connection</strong> und anschliessend <strong>Connect</strong>, was die
        Registry vom Gerät lädt. </li>
    <li>Suche in den Ordnern in der linken Spalte nach dem Ordner <strong>HKEY_LOCAL_MACHINE </strong>&gt;<strong>
            Software </strong>&gt;<strong> HTC</strong> &gt;<strong> Camera</strong> &gt;<strong> P10</strong>. </li>
    <li>Markiere den Ordner <strong>P10</strong> in der rechten Spalte und doppelklicke auf <strong>Enable</strong> in
        der rechten Spalte. </li>
    <li>Setze nun den Wert von <strong>Value data</strong> von 0 auf <strong>1</strong> und bestätige mit OK. </li>
    <li>Schliesse die Applikation und kappe die Verbindung mit dem Computer. </li>
    <li>Öffne die Kamera App auf dem Smartphone, tippe rechts unten auf auf Einstellungen und nachher auf die Kamera
        resp. die Aufnahmemodus Auswahl. Hier kann nun der Modus GPS-Foto gewählt werden. Die GPS Bilder befindet sich
        übrigens nicht im selben Ordner wie die anderen, nicht GPS getaggten, sondern auf den Speicherkarte unter My
        Documents &gt; My POI. </li>
</ol>
