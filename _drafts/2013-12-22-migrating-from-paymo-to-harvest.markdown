---
layout: post
title: "Migrating from Paymo to Harvest"
comments: true
---

1. go to https://www.mashape.com/paymo/pm-time-tracking-invoicing-paymo#!endpoint-paymo-users-getList
2. go to /paymo.auth.login and fill in the data with "json" as the format.
3. go to /paymo.entries.findByUser and fill in the auth_token from above. and look for the user id via the web interface. and again format "json"
4. go to /paymo.projects.findByUser and fill in the auth_token and the user again to retrieve the data in json format.

Then use some clojure magic and transform the json data into a single csv that can be imported here http://www.getharvest.com/help/account-settings/managing-account-settings/importing-and-exporting-data