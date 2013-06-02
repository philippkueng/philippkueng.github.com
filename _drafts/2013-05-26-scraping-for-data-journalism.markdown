---
layout: post
title: "Scraping for Journalists"
comments: true
---
**It is nice when the data which is needed is already available but in case it is not, that should not be a hindrance.**

Since 2009, when the British Guardian started publishing articles based on hard — non negotiable — data, people have been embracing the interdisciplinary nature of data journalism.

That means working together with all kinds of people to get a story out the door. In my case I was happy to help [David Bauer](http://www.davidbauer.ch/) from the newspaper [TagesWoche](http://www.tageswoche.ch/) with an article about the miserable parking situation in Basel. The story was politically motivated though lacked the data to prove either side.

Lucky for us, all the car parks are connected to a central system which is gathering the available slot count and then publishes it on their [website](http://www.parkleitsystem-basel.ch/stadtplan.php).

## The Source

In our case the data is getting served through an HTML page, without gimmicky things like loading the available slot count through Javascript, which reduces the complexity dramatically.

![The Parkleitsystem Basel Website](images/pps_basel.png)

## The other objective

Besides writing code that gathers the data, I also wanted to create something as easy and reusable as possible so others can scrape too. For this project I decided to go with Python since it is a bit more popular in the science world than Ruby and thus might be more useful to journalists. Also it is fairly easy to pick up; for example with the [Python course on Codeacademy](http://www.codecademy.com/tracks/python))

## Hello World
First of all we create a file called `app.py` and insert the code below to create a Hello World application.

{% highlight python %}
# app.py
import sys
sys.stdout.write('Hello World')
{% endhighlight %}

Go ahead and execute it with the command `python app.py` from within your terminal. If you are seeing a “Hello World” message you are all set. Press Ctrl + C to terminate it.

## Scraping the website
Next up we are tackling the fetch & parse part. For this we extend our example above by adding a requirements.txt file to the folder and filling it with packages we will for the scraper.

{% highlight python %}
# requirements.txt
lxml==3.2.1
wsgiref==0.1.2
urllib3==1.5
gdata==2.0.17
{% endhighlight %}

Before we can startup the application for the second time we need to make sure all dependencies are installed. For this we create a virtual environment with the command `virtualenv venv --no-site-packages`, so packages are not getting installed globally.  Then we activate the environment by sourcing it `source venv/bin/activate`. Finally we can install the dependencies by issuing `pip install -r requirements.txt`.

Now we can go ahead and extend `app.py` by importing the parser library called [lxml](http://lxml.de/) and the one for doing the GET requests against the “parkingleitsystem” website called [urllib3](https://github.com/shazow/urllib3).

After importing the packages we must instantiate a urllib3 PoolManager which will manage the connections to the sites we are fetching. Right after that, we are ready for the first GET call. Fetch the resource of your choosing, in our case it is the car park website. Since servers might go down, we need to check that the response is successful from a remote servers perspective. Meaning in case the site which we are requesting is down we will get a non 200 status code, so we can omit going through the trouble of trying to parse it since if there is content in the response it is quite unlikely the one we are expecting.

Let us assume our response was successful. This means we now need to run the response data through the html parser package (lxml). After the parsing process is done we can loop through the DOM tree by leveraging CSS selectors.

{% highlight python %}
# app.py
import urllib3
import lxml.html

http = urllib3.PoolManager()
r = http.request('GET', 'http://www.parkleitsystem-basel.ch/stadtplan.php')
if r.status == 200
    lots = []

    root = lxml.html.fromstring(r.data)
    for tr in root.cssselect("table[summary='Parkhaus DATEN']>tr[class='boxstatustr']"):
        parkingarea_name = tr.cssselect('td>a')[0].text
        parkingarea_lots = tr.cssselect('td>b')[0].text
        lots.append(parkingarea_lots)
{% endhighlight %}

---




After that we are then creating another route, here it is called `/scrape` which when called with the browser will execute our code to fetch the remote resource, parse and save its data. We then instantiate a new version of urllib3 and making a GET request against the target website. There are also other types of request types one can make with GET being the easiest one. GET simply asks for a resource without providing any data, a static resource for example. POST on the other side requires you to send some information with it, which it will then use to calculate an answer for you, like a contact form.

As soon as the response is coming back we have to check its status. A status of 2xx is a good sign while any other means something went wrong somewhere.

Then we will use the lxml package for parse the response data for us so we can query it with CSS selectors to extract the valuable data.




That meant we could fetch the page in an interval of 10 minutes, parse it and save the entries into the Google Spreadsheet.







Journalists started to code, developers started to design and designers started to write. Well some did both; you got the point.







Journalism is transforming. A story can no longer just stay for itself, it has to have the raw data — from which the story was created from — with it.

---


Over the course of the last month I had the opportunity to help David Bauer from the TagesWoche, a newspaper covering the Basel (Switzerland) region, to collect data for an article he wrote about Basel's miserable parking situation.

## Goal
The task was pretty straight forward, fetch the [parkleitsystem-basel website](http://www.parkleitsystem-basel.ch/stadtplan.php), parse it to extract the available lots and save the data into a Google Spreadsheet for later analysis. Repeat the steps in a 5 minute interval.

## Implementation
From the start I wanted that even non-programmers are able to use the codebase and run it themselves without further knowledge on how to run python scripts or setting up servers. Based on that vision I decided to go with heroku since it seemed that the initial hurdle is fairly low and well documented, plus even people working in Windows-shops can deploy applications.




2 Issues: - 30second limit, cronjob




From the start I had the vision that even non-programmers should be able to modify the scraper application I was going to write and set it up themselves so they can collect any data they want. So it could not be a script you would execute from your terminal since most journalists probably work in a Windows shop.







# Der Parkleitsystem Basel Scraper - Technische Details

Den heute morgen von der Basler Tageswoche publizierte Artikel über den chronischen Parkplatzmangel in Basel 

einen Artikel über den chronischen Parkplatzmangel in Basel. 





Für mich als Pendler natürlich unverständlich, dennoch interessant um dies graphisch zu sehen.


Das Problem und daher die daraus resultierende Geschichte war von vornherein klar, doch benötigte es Daten um die im Raum stehenden Theorien zu bestätigen.




Die Story selbst wurde nach datenjournalistischen Grundsätzen erstellt. 

Das heisst, Daten sammeln, bereinigen, auswerten und dies alles mit offenen und nachvollziehbaren Prozessen um  
