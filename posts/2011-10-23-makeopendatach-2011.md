Date: 2011-10-23
Title: MAKE.OpenData.ch 2011
Comments: true
Tags: Hackathon, OpenData.ch, OpenData

<p><a href="https://www.flickr.com/photos/agentcmos/6203132361/"
        title="MakeOpenData Camp 2011 @ EPFL by Philipp Küng, on Flickr"><img
            src="https://farm7.static.flickr.com/6153/6203132361_a01dca40de_b.jpg"
            alt="MakeOpenData Camp 2011 @ EPFL"></a></p>

<p>In an effort to make the world a better place, hackers all around Switzerland joined this years make.opendata.ch
    hackathon in Zürich and Lausanne. The goal was to use publicly available data, so-called <strong>OpenData</strong>
    and visualize it in a meaningful way so everyone is able to make sense of it.</p>

<p>Despite of having a french language deficit - it was a dark chapter in grammar school - i travelled all the way to
    EPF Lausanne which was absolutely worth it.</p>

<p>After the kickoff <a href="https://twitter.com/#!/florin_iorganda">Florin</a>, <a
        href="https://twitter.com/#!/FredericJacobs">Frederic</a> and I immediately started working on a project to
    improve the routes suggestion of traditional mapping applications such as Google Maps and OpenStreetMap by providing
    a way to add obstacles to a map and then calculate a new obstacle-free route to help people on tight schedules
    arrive on time. While we knew that large companies are working on that we were still looking for a hack to finish
    something usable until the deadline the day after.</p>

<p><strong>The theoretical solution</strong> - The frontend would be a static website where the user can enter departure
    and destination location. This then would make an API call to the backend where the hacks are doing its&#8217; part.
    The backend would consist of a webkit process running, controlled by PhantomJS. If a request gets issued PhantomJS
    loads Google Maps Directions with the start and end location, let the server-side webkit process render the page and
    then add all the obstacles via Lat/Long with a predefined icon which is easily distinguishable from the map itself.
    Next, PhantomJS creates a PNG-screenshot of the obstacles and route containing website. It starts the next process
    which parses the PNG pixel-by-pixel and looks if there is a blue line and an obstacle crossing. If so, make a circle
    of 300m radius around the obstacle and randomly add a Lat/Long coordinate, being part of the circle border, as a
    waypoint to the routes call of Google Maps. Then repeat the process above to check if the new route interferes with
    obstacles. If finally and obstacle-free route is found, return the details to the frontend.</p>

<p>During dinner, about three hours in, we came to the conclusion that it is just too much of a hack to spend valuable
    hacking time on, so we had to find something more suitable for the next day. Which we did in SwissMap.</p>

<p><a href="https://www.flickr.com/photos/agentcmos/6203706302/"
        title="MakeOpenData Camp 2011 @ EPFL by Philipp Küng, on Flickr"><img
            src="https://farm7.static.flickr.com/6153/6203706302_dbd6f92b8e_b.jpg"
            alt="MakeOpenData Camp 2011 @ EPFL"></a></p>

<p>Full of vim and vigor we then started on Saturday morning, Florin by collecting the interesting data from all over
    the <a href="https://www.bfs.admin.ch/">bfs website</a>, Frederic by merging and crunching the data into a format
    which is then processable via Javascript and I took care of the view and the comparing alogrithm. We aimed at
    building a web application where citizens and data-journalists can compare two different, unrelated datasets and
    visualize the outcome on a swiss heatmap. Luckily our very intense and focused hacking on day two was enough so that
    we were able to meet the presentation deadline in the afternoon. Epic Win.</p>

<p><img src="/assets/images/2011/10/swissmap_screenshot.jpg" alt="SwissMap Screenshot" /></p>

<p>[ <a href="https://swissmap.bitfondue.com/">live</a>, <a
        href="https://makeopendata.ch/doku.php?id=project:swissmap">wiki</a>, <a
        href="https://github.com/philippkueng/swissmap">source</a> ]</p>

<p>I hereby thank the sponsors, hackers and especially the team behind the <a
        href="https://makeopendata.ch/">MAKE.OpenData project</a> Andreas, Hannes, Oleg, Antoine, François, Frederic and
    Jeremy very much for making the event possible and inspiring us.</p>

<p><strong>Amazing MAKE.OpenData projects others have built</strong></p>

<ul>
    <li>green-street [ <a href="https://opendata.utou.ch/lausanne/">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:green_street">wiki</a>, <a
            href="https://github.com/loleg/green-street">source</a> ]</li>
    <li>gesagt-im-parlament.ch [ <a href="https://gesagt-im-parlament.ch/">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:parlament">wiki</a>, <a
            href="https://github.com/gwrtheyrn/gesagt-im-parlament.ch">source</a> ]</li>
    <li>politnetz visualization [ <a href="https://www.riaforweb.com/BTCPOLIT/">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:politnetz">wiki</a> ]</li>
    <li>Swiss Army Contaminated Sites [ <a
            href="https://lab.interactivethings.com/swiss-army-contaminated-sites/">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:swiss_army_contaminated_sites">wiki</a> ]</li>
    <li>Where Did My Taxes Go [ <a href="https://wheredidmytaxesgo.nelm.io/">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:wheredidmytaxesgo">wiki</a>, <a
            href="https://github.com/Seldaek/wheredidmytaxesgo">source</a> ]</li>
    <li>openletten [ <a href="https://www.tamberg.org/makeopendata/2011/jquery.html">live</a>, <a
            href="https://makeopendata.ch/doku.php?id=project:openletten">wiki</a>, <a
            href="https://bitbucket.org/tamberg/makeopendata/overview">source</a> ]</li>
</ul>
