Date: 2010-05-19
Title: Subversion Verzeichnisse in Filezilla ausblenden
Comments: true
Tags: untagged

<img src="/images/2010/5/filezilla-hide-hidden-folders-step1.png"
    alt="Subversion Verzeichnis in Filezilla ausblenden - Schritt 1" />
<p>Normalerweise schreibt man etwas Code auf dem eigenen Rechner, testet diesen und f&uuml;gt ihn zum <a
        title="Subversion" href="http://en.wikipedia.org/wiki/Subversion_(software)">Subversion</a> Verzeichnis hinzu,
    danach wird die aktuelle Version exportiert und per <a title="Filezilla Client"
        href="http://filezilla-project.org/download.php?type=client">Filezilla</a> auf den eigenen Server hochgelden.
    Dies macht Sinn, da somit fixe Versionen vorhanden sind auf die allf&auml;llig wieder zur&uuml;ck gewechselt werden
    k&ouml;nnte.</p>
<p>Sch&ouml;n und gut, doch was wenn die Applikation schon w&auml;hrend dem programmieren laufend auf dem Server
    getestet werden will? L&auml;dt man dann die ganzen SVN Verzeichnisse auch hoch? Oder jeweils einfach Datei um
    Datei, sodass die Subversion Daten nur auf dem eigenen Rechner bleiben.</p>
<p>Es gibt eine viel einfachere L&ouml;sung. Zuerst wird <strong>View</strong> im Menu ausgew&auml;hlt und danach auf
    <strong>Filename filters</strong> geklickt. Alternativ geht auch der Tastatur Shortcut <strong>Ctrl + I</strong>. Im
    neu erscheindenen Fenster aktiviert man das <strong>H&auml;ckchen bei CVS and SVN directories</strong> und schon
    werden die Subversion Verzeichnisse von Filezilla ignoriert.</p>
<img src="/images/2010/5/filezilla-hide-hidden-folders-step2.png"
    alt="Subversion Verzeichnis in Filezilla ausblenden - Schritt 2" />
<p>Nun ist es m&ouml;glich einen Ordner, welcher ein SVN Verzeichnis beinhaltet auf den Webserver zu laden ohne dass
    dabei die Subversion Dateien ebenfalls &uuml;bertragen werden.</p>
