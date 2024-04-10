Date: 2010-01-26
Title: Website mit WGET und einer Batch Datei sichern
Comments: true
Tags: untagged

<p>Computer Backups sind wie gesunde Ern&auml;hrung. Man <s>verdr&auml;ngt</s> vergisst sie aus Bequemlichkeit bis es zu
    sp&auml;t ist. Dabei w&auml;ren zumindest Website Backups so einfach zu bewerkstelligen. Wie das genau geht werde
    ich in mehreren Teilen zeigen.</p>
<p>Um den Speicherplatz mit all den wichtigen Bildern und Dateien zu sichern bedienen wir uns des unter der <a
        href="https://en.wikipedia.org/wiki/GPLv3#Version_3">GPL Version 3 Lizenz</a> stehenden <a
        href="https://www.gnu.org/software/wget/">WGET</a> Programms. Da WGET in <a
        href="https://de.wikipedia.org/wiki/C_(Programmiersprache)">C</a> geschrieben ist, sollten &auml;hnliche Backup
    Methoden mit diesem Programm auch auf anderen Betriebssystemen m&ouml;glich sein. Der Einfachheit halber (und weil
    ich kein Mac besitze) werde ich hier jedoch nur die Sicherung unter Windows demonstrieren.</p>
<p><strong>Zuerst einmal was ist eine Batch Datei?</strong><br />
    Eine Batch Datei ist eine normale Text Datei mit der Endung .txt. Der einfachste Weg die Text Datei in eine Batch
    Datei zu verwandeln ist, diese in Notepad zu &ouml;ffnen, und danach auf Datei &gt; Speichern unter zu klicken. Im
    nun erscheinenden Dialog w&auml;hlt man f&uuml;r Dateityp Alle Dateien (*.*) aus. Nun kann der neue Dateinamen mit
    der Endung .bat eingegeben werden. <i>Bsp.: website-sicherung.bat</i>. Danach auf Speichern klicken und man hat eine
    eigene Batch Datei erstellt.</p><img src="/assets/images/2010/1/website-sicherung-bat-notepad.png"
    alt="Batch Datei in Notepad erstellen" />
<p>Die Anweisungen, welche in die Batch Datei kommen sind aufgebaut wie folgt. <br /><strong>Wichtig:</strong> Es gilt
    alles auf nur eine Linie zu schreiben, da dies sonst als 2 verschiedene Befehle interpretiert wird.</p>

{% highlight text %}
[Speicherort der wget.exe Datei] -P[Speicherort der lokalen Website Kopie] ftp://[FTP Benutzername]:[FTP Passwort]@[FTP
Domain] -m
{% endhighlight %}

<p><strong>Speicherort der WGET Datei</strong><br />
    Dabei gilt es zu beachten, dass falls der Pfad der WGET Datei Leerzeichen enth&auml;lt, alles mit
    Anf&uuml;hrungszeichen geschrieben werden muss ansonsten interpretiert der Computer die Zeichen nach dem ersten
    Leerzeichen als Variable f&uuml;r das Programm. <i>Bsp.: "C:\wget ordner\wget.exe"</i></p>
<p><strong>Speicherort der lokalen Website Kopie</strong><br />
    Das Zeichen -P kennzeichnet den nachfolgenden Pfad als Speicherort f&uuml;r die heruntergeladenen Dateien. Es ist
    wichtig das kein Leerzeichen zwischen -P und dem Nachfolgenden Pfad ist, da WGET sonst annimmt der Speicherort sei
    Leer. <i>Bsp.: -P"C:\website sicherung"</i></p>
<p><strong>FTP</strong><br />
    Nach dem Speicherort der Daten kommen die FTP Angaben. Da diese sehr unterschiedlich von der eigentlichen Website
    sein k&ouml;nnen, empfehle ich hier das jeweilige Datenblatt vom Hosting Anbieter anzuschauen. <i>Bsp.:
        ftp://admin:passwort@ftp.example.com/</i></p>
<p><strong>Kopierverfahren</strong><br />
    Zum Schluss folgen die Zeichen -m, was bedeutet das ein Mirroring (exakte Kopie) erstellt wird.</p>
<p>Nachdem nun alle Parameter gekl&auml;rt sind, kann das Beispiel Kommando zusammengesetzt werden.</p>

{% highlight text %}
"C:\wget ordner\wget.exe" -P"C:\website sicherung" ftp://admin:passwort@ftp.example.com/ -m
{% endhighlight %}

<p><strong>Tipp f&uuml;r Windows Vista / 7 Benutzer:</strong> Falls die Website Kopie auf dem C Laufwerk gespeichert
    werden sollen, sind evt. Administrator Rechte notwendig.</p>
<p>Schritt 2 wird sich um das sichern der Datenbank drehen und n&auml;chsten Montag hier erscheinen.</p>
