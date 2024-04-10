Date: 2010-08-12
Title: Google - Killer des eigenen Fortschritts
Comments: true
Tags: Opinion

<a title="Jet Engine by wwarby, on Flickr" href="https://www.flickr.com/photos/wwarby/4782920540/" ;=";"><img
        alt="Jet Engine" src="https://farm5.static.flickr.com/4135/4782920540_1fc6a1a0dd_b.jpg" ;=";" /></a>
<p>Das Titelbild ist von <a href="https://www.flickr.com/photos/wwarby">wwarby</a> und steht unter <a
        href="https://creativecommons.org/licenses/by/2.0/">CC-BY 2.0</a>.</p>
<p><strong>Google’s Irrfahrt</strong> <br />Es werden zu diesem Zeitpunkt wohl alle Wissen, dass Google das Wave Projekt
    offiziell für beendet erklärt hat. An dieser Stelle lässt sich streiten ob wirklich die vermeintlich wenigen Nutzer,
    oder ein Entscheider in der Chefetage dem innovativen Produkt den Todesstoß verpasste. <br />Ähnlich verwirrt agiert
    Google mit ihrem Hosting Angebot, der AppEngine. Die Sprachen Python und Java sind vielen Programmierern ein
    Begriff, zudem ist die angebotene Datenbank auf BigTable aufgebaut und somit schnell und gut skalierbar. Zu guter
    letzt wird das Paket AppEngine mit vielen APIs ausgestattet die dem Entwickler wiederum mögliche Sorgen abnehmen
    können. Klingt nach einem Programmierer Traum, oder?</p>
<p><strong>Gratis was will man mehr?</strong> <br />Um Unternehmen dazu zu bewegen ihre Software auf die Google Cloud
    Plattform zu migrieren, wird zusätzlich eine gratis Quota angeboten. Bei Projekten mit geringer Nutzung und
    Anforderungen können daher durchaus Seiten mit finanziellem Nutzen entstehen ohne, dass dafür selbst monetäre
    Ressourcen benötigt werden.</p>
<p><strong>Der Teufel steckt im Detail</strong> <br />Die Limitierungen der Plattform treten teilweise erst während der
    Entwicklung ans Tageslicht. Beispielsweise ist die Datenbank durchaus performant, erlaubt allerdings nicht mehr als
    1000 Einträge pro Entity (quasi Tabelle bei einer sonst üblichen relationalen Datenbank) zu speichern und stellt
    sich somit für viele Projekte als untauglich heraus. Ein weiterer Punkt ist die 30 Sekunden Regel, die eine Seite
    vom Server bekommt, bis der den jeweiligen Prozess stoppt. Für etwas aufwendigere Datenverarbeitung oder laden einer
    externen Ressource lässt sich AppEngine somit auch nicht wirklich einsetzen.</p>
<p><strong>Was jetzt?</strong> <br />An dieser Stelle frage ich mich, sollen wir uns neben der Lösung des eigentlichen
    Problems (des Programmierens) zusätzlich den Kopf zerbrechen wie die jeweilige Logik an die komplett verschiedene
    Umgebung angepasst werden kann, und uns womöglich sogar einem massiven Vendor-Lock-In unterwerfen oder von Beginn an
    auf eigens konfigurierte virtuelle Server setzen? </p>
<p>Habt ihr auch schon Erfahrungen mit AppEngine oder ähnlichen Anbietern gemacht? Auf welches Pferd habt ihr
    schlussendlich gesetzt?</p>
