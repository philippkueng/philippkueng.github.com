---
layout: post
title: "Automatically deploy to Heroku from Github"
comments: true
---

While starting on a new project the other day I decided to automate as much as possible. One of those tasks was deploying to [Heroku](https://www.heroku.com/) when pushing the master branch to [Github](https://github.com/). It took me some time to figure certain parts out, even though the documentation is quite extensive; guess it being a beta feature didn't help.

1. Start by going into the **Settings > Webhooks & Services** view and add the **HerokuBeta** Service.
2. Create the app on Heroku via the command line `heroku create myapp`
3. Fill in `myapp` as the **Name** in the HerokuBeta settings view and leave **Github api url** empty.
4. Then for the Heroku token, you'll need your Heroku api token, which you get via `heroku auth:token` (eg. token123) and your email address you're using to login to Heroku (eg. hi@email.com). Then convert the two into a base64 hash for the Authorization header by issuing this command on a Unix system `echo "hi@email.com:token123" | base64` (eg. base64-123).

        curl -X POST https://api.heroku.com/oauth/authorizations \
        -H "Accept: application/vnd.heroku+json; version=3" \
        -H "Authorization: Basic base64-123" \
        -H "Content-Type: application/json" \
        -d "{\"description\":\"direct token description (preferably meaningful)\"}"

5. For the **Github token** follow the instructions and head to [https://github.com/settings/applications](https://github.com/settings/applications) where you can click **Create new token**, then give it a name and leave the default settings before hitting **Generate token**. Then copy this token and fill it into the form.
6. Save the configuration with **Add service**.
7. I first thought the hook is already working, however it's only working with Github deployment events, which you can add by adding another service called **Github Auto-Deployment**.
8. Repeat step 5 to acquire a new Github token and add it there, save and from now on your automatic Heroku deployment should be fully working.