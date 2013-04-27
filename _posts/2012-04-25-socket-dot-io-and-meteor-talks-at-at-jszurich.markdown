---
layout: post
title: "Socket.io and Meteor Talks at @JSZurich"
comments: true
---
For the april event of [@JSZurich](https://twitter.com/#!/jszurich), @streunerlein and i had the honor of talking about [socket.io](http://socket.io/) and the new kid on the block, [meteor](http://meteor.com/). As you can see the slides and recordings are embedded below. Enjoy. As for the recordings, sorry it's raw, MTS is not the friendliest format.

## Socket.io

**Abstract** - It's a Javascript wrapper library written for Node.js which makes the usage of websockets a lot easier. It also takes care of supporting older browsers with multiple fallbacks. By using socket.io, creating "realtime" applications is a matter of minutes.

<div style="width:654px" id="__ss_12675407"><iframe src="http://www.slideshare.net/slideshow/embed_code/12675407?rel=0" width="654" height="546" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div><br><br><br>

<iframe width="654" height="362" src="https://www.youtube.com/embed/ry2fe9os6fc" frameborder="0" allowfullscreen></iframe>

<iframe width="654" height="362" src="http://www.youtube.com/embed/CW1Y1ct_IRU" frameborder="0" allowfullscreen></iframe>

## Meteor

**Abstract** - Meteor is an opinionated toolset of common Node.js npm packets and some custom code. Among many things it enforces the use of Fibers, Socket.io and MongoDB both on the server aswell as on the client side.

<script async class="speakerdeck-embed" data-id="4f9724d5947c450022024e02" data-ratio="1.3333333333333333" src="//speakerdeck.com/assets/embed.js"></script><br><br><br>

<iframe width="654" height="362" src="http://www.youtube.com/embed/0mplHShxPWA" frameborder="0" allowfullscreen></iframe>

<iframe width="654" height="362" src="http://www.youtube.com/embed/nqsLYKzAdMQ" frameborder="0" allowfullscreen></iframe>

Here is some explanation on what I said during the talk for those who were not present. I am well aware that I did not sell Meteor as the next big project that everyone has to pick up. The reason is simply that it is really in its early stage of development. Additionally I think it is rather dangerous to sell Meteor as a framework for beginners, since its magic bits hide a huge amount of logic a beginner normally does not need to use in order to build a hello world application. By embracing Meteor the novice programmer does not learn anything about those hidden areas which probably lead to unexpected results here and there. After all distributed systems are hard to build.

An example for such a use-case is the todos application which comes bundled with meteor. It is nicely done and quite easy to understand, but what happens for instance if 2 users, with a high latency connection to the server, update the same entry at about the same time? Your changes will be reflected immediately on your machine, with the syncing following a few seconds later, and a few seconds later from there you might be surprised to see that your original changes have been written over by the second user. With a traditional stack you would do some locking or at least insert versioned entries, but with MongoDB this is not supported by default. You would be able to implement versioning yourself by using timestamps and inserts for every update but why the additional overhead?

Just to state it again, the words above do reflect my personal experience when playing with Meteor 2 weeks after its initial appearance in April 2012, and I will be happy to give it another try once it has somewhat matured.

As for the @JSZurich event, thanks to @ikr for hosting us and @seldaek for organizing it.