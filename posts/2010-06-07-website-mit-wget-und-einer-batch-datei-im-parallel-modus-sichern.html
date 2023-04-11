Date: 2010-06-07
Title: Website mit WGET und einer Batch Datei im Parallel-Modus sichern
Comments: true
Tags: untagged

<img alt="festplatte" src="/images/festplatte.jpg" />
<p>Im Januar 2010 habe ich hier auf diesem Blog eine Möglichkeit vorgestellt wie mithilfe einer Batchdatei und des Open
    Source Programms WGET die eigenen Webseiten offline gesichert werden können. <a
        href="http://philippkueng.ch/post/Webspace-mit-WGET-und-einer-Batch-Datei-sichern.aspx">Website mit WGET und
        einer Batch Datei sichern</a></p>
<p>Bei vielen verschiedenen Webseiten kann der Sicherungsvorgang leider ganz schön viel Zeit beanspruchen da <a
        href="http://www.gnu.org/software/wget/">WGET</a> und das Batch Skript lediglich seriell ausgeführt werden. Es
    gibt allerdings eine Möglichkeit wie das Backup quasi parallel ausgeführt wird. Als Ausgangspunkt brauchen wir das
    schon erstellte Backup Skript vom Januar 2010 (backup_skript), welches ungefähr so aussieht:</p>

{% highlight text %}
"C:\wget ordner\wget.exe" -P"C:\website sicherung 1"
ftp://admin1:passwort1@ftp.example1.com/ –m

"C:\wget ordner\wget.exe"" -P"C:\website sicherung 2"
ftp://admin2:passwort2@ftp.example2.com/ –m
{% endhighlight %}

<p>Im Ordner, in welcher sich diese Datei befindet, erstellen wir nun einen Unterordner, in meinem Falle
    <strong>website_backup</strong>. In dem Ordner website_backup wird für jede einzelne Website eine eigene Batch Datei
    erstellt, bsp.: example1.bat. In example1.bat kommen nun die Anweisungen, welche nur diese eine Seite betreffen, in
    unserem Beispiel also:</p>

{% highlight text %}
"C:\wget ordner\wget.exe" -P"C:\website sicherung 1"
ftp://admin1:passwort1@ftp.example1.com/ –m
{% endhighlight %}

<p>Diese Schritte werden wiederholt bis alle Anweisungen im Skript backup_skript in einzelnen Batch Dateien im Ordner
    website_backup vorhanden sind.</p>
<p>Zum Schluss öffnet man die Datei backup_skript mit einem Editor und es wird pro Batch Datei im Ordner website_backup
    eine Linie eingefügt. </p>

{% highlight text %}
START website_backup\example1.bat
START website_backup\example2.bat
etc.
{% endhighlight %}

<p>Falls nun das Skript backup_skript aufgerufen wird, öffnen sich viele verschiedene Fenster gleichzeitig, wodurch der
    Backupprozess eine gewisse Parallelität gewinnnt.</p>
