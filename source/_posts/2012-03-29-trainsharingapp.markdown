---
layout: post
title: "TrainsharingApp"
date: 2012-03-29 01:00
comments: true
---
![into image](images/DSC_4670.jpg)

Sharing a train, something the swiss twitter community did for years via the hashtag [#trainsharing](https://twitter.com/#!/search/%23trainsharing) should now be brought to the masses with a dedicated app.

My goal is to realize the backend as well as various mobile clients with the help of other hackers during the [make.opendata.ch hackathon](http://make.opendata.ch) to show off what can be done by leveraging publicly accessible data. And just for the fun of jumping on the buzzword bandwagon, it'll be [SoLoMo (social-local-mobile)](http://techcrunch.com/2012/03/24/die-solomo-die/) ;-).

<!-- You're probably already as sick of apps as I am but nonetheless these ideas keep popping into my head so why the heck not just realize them? Especially since there's an opendata hackathon dedicated to public transportation taking place this friday and saturday called [MAKE opendata.ch](http://make.opendata.ch). -->

## What led to the idea

Day in and day out i'm commuting back and forth from where i live to Zürich. In order not to see those hours spent commuting as wasted time, you'll have to spend it wisely which often times means doing some kind of work. As a programmer that's cake ;-). However there are times you just want to talk to someone remotely familiar. You could obviously do some kind of creepy stalking and wait outside the train until the very last minute before departure to see if you see someone familiar. Chances are you'll either find no one or they actually want/have to do work instead of chit-chat with you. So status quo sucks, right? Well could we improve it?

## The idea

Obviously yes. Let's create a mobile app that allows to checkin to a train and then find conversation-partner-matches via [Twitter](https://twitter.com), [Facebook](https://www.facebook.com/) and maybe even [Foursquare](https://foursquare.com/).

## The User Interface

When starting the app for the first time you're using one of those buttons on the login screen to connect to your favourite network and start using the TrainsharingApp.

![trainsharing-login](images/trainsharing-login.png)

As a next window you're seeing the home screen on which you can enter your commuting route. This will make a call to sbb.ch to get the timetable and save it locally for later reuse. If you've already used this route there's a quick dial button to select your route and then select the departure time on the following view.

![trainsharing-home](images/trainsharing-home.png)

As soon as you've chosen a time, you're automatically checked in to that train-route which will trigger a push notification to users on the same train or users which will share part of your route and with whom you are friends on one of the social networks offered at login. 
After sending those notifications to friends or receiving one you're able to initiate a Meetup by selecting their name, selecting optional information and tipping the "Meetup" button.

![trainsharing-social](images/trainsharing-social.png)

## The Technical Implementation

As for the backend, there exists an already scraped static dataset of train lines with their according numbers, eg. S8 18898 and each route (Station to Station, see below). All in all about 230'000 routes which will reside inside a MySQL DB. In case you want to play around with the dataset, here's a [routes table dump](files/trainsharing_routes.sql).

|id|linename|dep_station|dep_time|arr_station|arr_time|
|:-|:-------|:----------|:-------|:----------|:-------|
|1|S2725920|Waldshut|06:24|Koblenz|06:29
|2|S2725920|Koblenz|06:44|Klingnau|06:47

For matching friends there'll be some kind of NoSQL DB instance since MySQL isn't that good at it without creating a lot of table and row overhead. Still needs to be figured out, suggestions are welcome.

Additionally there'll be a join table (routes_users, see below) for matching the routes with users. Since the routes_users table can fill up quite fast and past data doesn't need to be held warm, it'll be pushed to S3 for later analysis and then cleared every 24 hours.

|id|routes_id|users_id|start_time|
|:-|:--------|:-------|:---------|
|1|423|234412345|12:03
|2|5122|967512345|14:34

So much for the storage part, now over to the API. There'll there will be three endpoints at least, `/login`, `/checkin` and `/read`.

**/login** will be used to send the social network authentication tokens over to the server to allow us to do the bandwith heavy parts. The request should be one of type POST with the credentials in it's body. Which will give a trainsharingID back as a response. This trainsharingID will then be stored on the client device and used for every single request as a querystring.

|Key|Value|
|:--|:----|
|network|facebook, twitter or foursquare
|token|network_token
|token_secret|network_token_secret

**/checkin** is, as the name suggests, the endpoint for when a user wants to check in to a train ride. For clarification, a train ride consists of multiple routes (Station-to-Station) and may also involve switching trains. Requests to `/checkin` should also be of type POST with the trainsharingID in the URL as follows `/checkin?trainsharingID=your_trainsharing_id`. As for the POST body, it's the information getting delivered when clicking on the details section for the specific connection timetable on sbb.ch.

![sbb timetable screenshot](images/sbb_timetable_screenshot.png)

|Key|Value|  |Key|Value|
|:--|:----|:-|:--|:----|
|dep_st-1|Siebnen-Wangen|  |dep_st-2|Pfäffikon SZ
|dep_t-1|06:03|  |dep_t-2|06:19
|arr_st-1|Pfäffikon SZ|  |arr_st-2|Zürich HB
|arr_t-1|06:13|  |arr_t-2|06:48
|train_id-1|S2 18220|  |train_id-2|IR 1754

**/read** will be the only endpoint accessible via a GET request, though it still needs the trainsharingID in the querystring. `/read` is for manually asking if new overlaps have been found since checking in. The goal however should be that this endpoint is only used for development and new overlaps are sent to the user via PUSH notifications in a production setup.

Enough with the server stuff, what happens on the **mobile**? -Well, upon first launch of the app the user signs in with one of those social networks which will create an OAuth token and an OAuth token secret which will be sent to the `/login` endpoint mentioned above. The trainsharingID in the response then gets stored persistently in the application storage.

Next up is the home screen where the user can enter departure and arrival destination to look for available trains. This will trigger a POST request to sbb.ch from the phone, parsing the response and showing the available options to the user. If a user selects a specific time another GET request will be fired to fetch the details information for that connection whose response get's parsed and sent to the `/checkin` endpoint.

If matches already exists the response to the `/checkin` POST request will contain users from various networks who are matching the friends criteria. In case none exist yet the response will be empty. In both cases the user will be notified via PUSH if additional matches are made later on.

Both a proper UI and API endpoints for the meetup functionality still need to be figured out. Maybe it even makes more sense to use their native networks eg. Facebook or Twitter for messaging instead of building yet another Whatsapp clone.

Well, that's all there is to say about the TrainsharingApp at the moment. Have i missed something? Or do you have a specific suggestion what needs to be changed, added or removed?

In case you are interested in creating a native mobile client besides the one for WindowsPhone, which is already being covered by [Adrian](http://www.facebook.com/adriankue), let me know either via twitter or the comments below so I can get in touch with you. The same goes for designers too.