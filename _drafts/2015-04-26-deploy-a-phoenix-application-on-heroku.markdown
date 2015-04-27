---
layout: post
title: "Deploy a Phoenix Application on Heroku"
comments: true
---

1. Having different buildpacks
2. Putting the brunch build command as a npm post-install command
3. Adding the Database_url extraction method to the prod_secret.exs
4. Run the database migrations `heroku run mix ecto.migrate`