Date: 2010-02-02
Title: Automatische MySQL Backups mit MySQL Administrator unter Windows Vista / 7
Comments: true
Tags: untagged

<p>Letzte Woche haben wir gesehen wie man den <a
        href="https://philippkueng.ch/webspace-mit-wget-und-einer-batch-datei-sichern.html">Webspace sichern</a>
    kann. Dieses mal werden wir uns ums Backup der MySQL Datenbank kümmern.
    Kurz vorweg, ich werde ich in diesem Beitrag nur über das sichern einer von aussen zugänglichen Datenbank schreiben.
    Ebenfalls ist das hier gezeigte für Windows Vista / 7 vorgesehen.
</p>
<p>
    Bevor wir mit der eigentlichen Sicherung beginnen können, muss ein Passwort für das aktuelle Benutzerkonto vergeben
    werden. Um dies zu bewerkstelligen auf <i>Start > Systemsteuerung > Benutzerkonten</i> klicken und <i>Kennwort für
        das eigene Konto erstellen</i> anwählen. Passwort eingeben und bestätigen.
</p>
<p>
    <strong>Hinweis:</strong> Durch das hinzufügen eines Passwortes wird nun jedes mal nach dem Ruhezustand oder beim
    Hochfahren nach dem Kennwort gefragt. Für die Eingabe beim Hochfahren gibt es allerdings einen Trick sodass man es
    nie wieder eingeben muss und der Computer immer direkt ins Konto startet.
</p>
<p>
    <strong>Lösung:</strong> Klicke auf Start und gib ins Suchfeld <i>netplwiz</i> ein. Wähle nun das aktuelle Konto an,
    und entferne das Häkchen bei <i>Benutzer müssen Benutzernamen und Kennwort eingeben</i>. Nach einem klick auf
    Übernehmen sollte der Computer beim nächsten Starten nicht wieder nach dem Kennwort verlangen.
</p>
<p>Nachdem die Passwort Angelegenheiten geklärt sind können wir endlich mit der Sicherung der DB beginnen. Dafür
    benötigen wir das Programm MySQL Administrator welches Bestandteil der <a
        href="https://dev.mysql.com/downloads/gui-tools/5.0.html">MySQL GUI Tools</a> ist. Am einfachsten die Windows
    (x86) Variante (aktuell Version 5.0-r17) auswählen und herunterladen.
</p>
<p>
    <strong>Passwort Speicher</strong><br />Sobald das Software Paket installiert ist, kann man den MySQL Administrator
    mit der Angabe der Datenbank Daten starten. Damit die Backups automatisch ablaufen, müssen die Passwörter für den
    Windows Benutzer Account und die MySQL Datenbanken gespeichert werden. Klicke dafür in der Menüleiste auf
    <i>Tools</i> gefolgt von <i>Options</i>. Aktiviere das Häkchen bei <i>Store passwords</i> und wähle für <i>Password
        storage method</i> die Option <i>Obscured</i> aus. Bestätige alles mit einem klick auf <i>Apply</i> und
    anschliessend <i>Close</i>.
</p>
<img src="/assets/images/2010/2/mysql-administrator-options-password.png" alt="MySQL Administrator Options Window" />
<p>
    <strong>Sicherungsprojekt erstellen</strong><br />Nun zum Backup, klicke in der linken Spalte auf <i>Backup</i> und
    dann auf den Knopf <i>New Project</i>.Gib einen Namen für die Sicherung ein und füge zu sichernde Datenbanken mit
    eine klick auf den <i>></i> Knopf hinzu. Sobald alle notwendigen DBs hinzugefügt wurden, kann auf den Tab Reiter
    <i>Schedule</i> geklickt werden um die Sicherungsintervalle festzulegen.
</p>
<img src="/assets/images/2010/2/mysql-administrator-create-backup.png" alt="MySQL Administrator Backup erstellen" />
<p><strong>Sicherungsintervalle einstellen</strong><br />Setze zuerst das Häkchen bei <i>Schedule this backup
        project</i> und gib den Pfad und den Dateinamen an unter welchem die MySQL Datei auf dem Computer abgelegt
    werden soll. Weiter unten findet man die ziemlich selbst erklärenden Einstellungen wo festgelegt werden kann wann
    und in welchen Abständen eine Sicherungskopie gemacht wird. Falls alle Variablen gemäss den individuellen
    Anforderungen eingestellt sind genügt ein klick auf <i>Save</i> und die Angabe des Passwortes des aktuellen Windows
    Benutzerkontos um die automatischen Backups zu aktivieren.
</p>
<img src="/assets/images/2010/2/mysql-administrator-schedule-backup.png" alt="" />
<p>
    <strong>Tipp:</strong> Der Speicherort für die .sql Datei sollte falls möglich nicht auf dem C Laufwerk liegen, da
    das Backup sonst aus Grund ungenügender Rechte scheitern könnte.
</p>
