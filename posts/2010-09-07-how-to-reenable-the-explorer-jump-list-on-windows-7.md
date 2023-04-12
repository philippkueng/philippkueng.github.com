Date: 2010-09-07
Title: How to reenable the explorer jump list on Windows 7
Comments: true
Tags: Windows
<img src="/assets/images/9-7-2010%202-24-21%20PM.png" />
<p>From one day to the other my pinned favorites in the explorer jump list were gone, and with it my workflow. </p>
<p>In order to fix the mess, open up explorer, insert the path below and press enter.</p>

```
%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations
```

<p><img src="/assets/images/9-7-2010%203-07-11%20PM.png" /></p>
<p>As a next step delete all the files inside this folder. Restart your computer. The jump list will now empty but it
    should work again.</p>
