---
layout: post
title: "Migrate the BlogEngine.NET commenting system over to Disqus"
comments: true
---
![comments](/images/2011/7/DSC_6717.jpg)

Offloading comments to a third party, namely [disqus](http://disqus.com/), is the initial step I'll take for migrating my current blog to a static alternative called [Jekyll](http://github.com/mojombo/jekyll/). But more on my decision in a later post. Let's focus on the steps necessary to get those comments up to disqus.

**Warning:** Because after the migration the comments are getting injected into the page via Javascript, Google and the rest of the Search-Engine-Mafia won't be able index them which basically means users won't be able to search for comments in your post when using a search engine.

**Disclaimer:** Actually all the tools and most steps used in this post are from [Migrating Existing BlogEngine.Net Comments to Disqus](http://blog.prabir.me/post/Migrating-Existing-BlogEngineNet-Comments-to-Disqus.aspx), however I ran into some issues while following the guide.

Now to the migration part, first of all we'll need to extract the existing comments from your blog. For doing so we'll use the [CommentExporter BlogEngine Extension](http://blog.prabir.me/files/2010/5/DisqusUploaderWithBlogEngineExtensions.zip) by [@prabirshrestha](https://twitter.com/prabirshrestha). Download and extract the extension, and upload the files inside the **www** directory into the according BlogEngine folders on your webserver. Then log into your blog and head over to the extensions tab of the administration dashboard. Make sure that the extension is **enabled** and then click the **edit** link next to. In this new window select the option **Intense Debate** from the dropdown menu and continue by pressing Export Comments.

Once you have the file on your desktop open it with you favorite text-editor and check that there is no HTML encoded user name inside the **<name>** tags. If they're encoded I strongly suggest rewrite them into their UTF-8 equivalent, otherwise they're getting messed up by disqus.

Now go ahead and create a disqus account for your blog if you haven't already.

Let's import. Log into your disqus account and select the blog you want the comments to appear on. Then head over to the **Tools** tab and select **Import / Export** on the left hand side. Select IntenseDebate as the format then choose the file and hit **Import**. Depending on the number of comments you have it might take disqus a while to import all of them.

Next up we need to make a minor modification to the BlogEngine source. Open up your FTP browser, select the file post.aspx in the root of your BlogEngine installation and open it. In there remove the following line
``` javascript
var disqus_url = '...';
``` 
and add the line 
``` javascript
var disqus_shortname = 'fill in your disqus domain username';
```
The reason for this change is the following: Because we've extracted and uploaded the comments with the pretty url the built in disqus commenting will look for comments matching the ugly but unique guid url, which leads to none of the comments are ever showing up. Of course modifying the export extension, using regex in the text-editor or uploading a URL map to disqus will lead to similar results.

Finally you're able to change the moderating system inside the comments tab of the BlogEngine administration dashboard to **Moderated by Disqus**. Now don't forget the fill in the **Disqus Website Short Name** and then upgrade your blog by saving the changes.

One last thing to note, if you're enabling comments for pages and you want the pretty urls for them too you'll need to apply the same modifications for page.aspx as we did with post.aspx.