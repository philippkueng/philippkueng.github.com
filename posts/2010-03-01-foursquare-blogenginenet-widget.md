Date: 2010-03-01
Title: Foursquare BlogEngine.NET widget
Comments: true
Tags: untagged

<p><strong>Notice</strong><br />There's a <a
        href="/2010-04-11-foursquare-blogenginenet-widget-version-03.html">newer release</a> available.
</p>
<img src="/assets/images/2010/2/foursquare-logo.png" alt="foursquare log" />
<p>Last Sunday I decided to build a <a href="https://foursquare.com">foursquare</a> sidebar widget for <a
        href="https://www.dotnetblogengine.net/" alt="BlogEngine.NET">BlogEngine.NET</a> since there wasn't anything
    around yet. The <a href="https://4squarebewidget.codeplex.com/releases/view/41093">current version</a> simply shows
    the last places you've checked-in and is mostly based on the twitter widget from <a
        href="https://madskristensen.net/">Mads Kristensen</a>.</p>
<img src="/assets/images/2010/2/foursquare-blogengine-widget.png" alt="blogengine sidebar widget for foursquare" />
<p><strong>Requirements</strong><br />
    In order to use the widget you will need to have .NET 3.5 installed on your server. I will probably port everything
    to .NET 2.0 later, but since I was used to work with LINQ, I implemented everything in .NET 3.5.
</p>
<p><strong>Installation</strong><br />
    First of all download the current version available at <a href="https://4squarebewidget.codeplex.com/">codeplex</a>.
    Extract it and upload everything to your BlogEngine directory into the widgets folder. If you've uploaded the files
    and switched your current BlogEngine installation to .NET 3.5 you're ready to open your site in the browser and add
    the widget to the sidebar.<br />
    After you've added the widget, you'll have to specify some settings regarding your foursquare feeds. Simply open <a
        href="https://feeds.foursquare.com" alt="foursquare feeds">https://feeds.foursquare.com</a> and copy-paste the
    urls for the rss and kml feeds into the according input fields inside the foursquare widget edit section. Then go to
    your foursquare page by clicking on me in the navigation bar at the top, copy and paste the url into the account url
    input field. Next decide how much your feed should be requested from foursquare. But keep in mind, that if you
    choose the number of request per hour to high you might get blocked by foursquare. I guess every 15 minutes should
    already be enough for the average user. Finally choose how many check-ins you want to display on your blog. Next
    save your settings, and then you're ready to enjoy foursquare together with BlogEngine.NET.

</p>
<p><strong>Important</strong><br />
    It's possible that the BlogEngine application has to be restarted, after you have added the foursquare widget.
</p>
<p>If you have any suggestions or ideas how the widget can be extended or improved please feel free to leave to contact me on <a
        href="https://twitter.com/philippkueng">twitter</a>.</p>
