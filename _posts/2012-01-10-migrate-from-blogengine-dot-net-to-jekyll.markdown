---
layout: post
title: "Migrate from BlogEngine.NET to Jekyll"
comments: true
---
This is the second part of steps you have to take in order to migrate smoothly over to [Jekyll](https://github.com/mojombo/jekyll/), [Octopress](http://octopress.org) in my case, coming from [BlogEngine](http://dotnetblogengine.net/) land. I'd recommend you first have a look at [moving your comments to disqus](http://philippkueng.ch/migrate-the-blogenginenet-commenting-system-over-to-disqus.html), before following this post.


##Getting the "old data"

Log into your BlogEngine site and head over to **Settings** where you click on the **Export** button for BlogML. Now FTP or SSH into your server and get a complete dump of the App_Data/files folder onto your local machine.

##Setup Octopress

Octopress? - Isn't this tutorial for Jekyll? - you might ask. Well Octopress is built on top of Jekyll and brings some plugins and clever defaults to make your life easier. Start off by following the official [Octopress Setup tutorial](http://octopress.org/docs/setup/). If your working on an OS X machine you might want to consider installing [POW](http://pow.cx) since it's making it much easier to work with Jekyll locally. Once POW is installed open your Terminal and go to ~/.pow and create a symlink to the octopress-repo root.

{% highlight bash %}
$ ln -s /Users/yourUsername/Documents/octopress myapp
{% endhighlight %}

Now open [http://myapp.dev](http://myapp.dev) in your browser to check if it's working so far.

##Import the "old data"

Create a folder `_import` inside the octopress/source directory and put the [blogml.rb](https://github.com/philippkueng/philippkueng.github.com/blob/source/source/_import/blogml.rb) conversion file in there.

{% highlight bash %}
$ cd octopress/source
$ mkdir _import
$ cd _import
$ wget https://github.com/philippkueng/philippkueng.github.com/blob/30ef1570f06d33938b18d5eee7767d6641b9a779/source/_import/blogml.rb --no-check-certificate
{% endhighlight %}

This import script was actually created by @derekmorrison to assist him by [Moving to Jekyll](http://doingthedishes.com/2011/04/14/moving-to-jekyll.html). Since URLs have to be rewritten because of the .aspx extensions which are part of BlogEngine I slightly modified the script to additionally create an .htaccess file and to play nice with non-ASCII encoded post-titles.

Next, move the BlogML.xml file inside the source directory and also create two seperate folders called `files` and `images` inside source. Then copy the contents of the previously dumped App_Data/files folder to their respective folders (images or files) by keeping the path structure intact. Means, that App_Data/files/2010/2/file.zip will go to octopress/source/files/2010/2/file.zip.

Now to the fun part, open your Terminal and navigate inside your octopress/source directory. Then execute:

{% highlight bash %}
$ ruby -r './_import/blogml.rb' -e 'Jekyll::BlogML.process("BlogML.xml")'
{% endhighlight %}

This should have imported all your existing posts so that you can now generate your Jekyll blog from it by exiting the source directory and issuing the rake command.

{% highlight bash %}
$ cd ..
$ bundle exec rake generate
{% endhighlight %}

##Deploying

There's already documentation available on how to [deploy Octopress to various hosting platforms](http://octopress.org/docs/deploying/). Since you're migrating from BlogEngine I highly recommend running your own VM or getting a shared hosting account with .htaccess support in order to not let your visitors down with feeding them broken links. Actually since Heroku is offering their polyglot Cedar-stack you should be able to run .htaccess on there too. YMMV

If your hosting provider is only offering FTP, then deploy manually by uploading the contents of the `public` folder and adding the `.htaccess` file from inside the source folder.

##Fixes

We're not quite done yet. Log into your [Google](http://www.google.com/webmasters/) and [Bing Webmaster](http://www.bing.com/toolbox/webmaster/) account and replace the sitemap.axd entry with sitemap.xml. The same goes for your [Feedburner](http://feedburner.com/) account, log in and replace feeds.axd with atom.xml.

Finally fix the [disqus](http://disqus.com/) comments. Log into their dashboard and select the account you want to migrate. Then click on the **Tools** tab and afterwards the **Migrate Threads** navigation entry. Hit the **Start Crawling** button for the Redirect Crawler Migration and your done.

##Update - 14th april 2014

[Eric Duncan](https://twitter.com/eduncan911) migrated his CommunityServer blog to Jekyll too by modifying the [BlogML import script (see comment below)](#comment-1327752341). For further details on how he did the migration, head on over to [his blog](http://eduncan911.com/software/please-put-your-blog-under-source-control.html) where he also provides a couple of ethical reasons why one should move to a public and versioned blog.