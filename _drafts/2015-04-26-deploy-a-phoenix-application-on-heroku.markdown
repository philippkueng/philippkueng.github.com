---
layout: post
title: "Deploy a Phoenix Application on Heroku"
comments: true
---

Since hearing of Phoenix the Elixir framework on the Changelog podcast, I've spent some time getting familiar with the framework.
However when it came to deploying it to Heroku there were a couple of things that weren't obvious to me initially like how run brunch to compile the assets or how to parse the `DATABASE_URL` environment variable provided.
## Having different buildpacks

* https://github.com/ddollar/heroku-buildpack-multi
* https://github.com/HashNuke/heroku-buildpack-elixir

```
# .buildpacks
https://github.com/heroku/heroku-buildpack-nodejs.git#34cffc9b6397bc1ce97a4b5e911fa771fc4e7907
https://github.com/HashNuke/heroku-buildpack-elixir.git#36f2ff22d0236589256d9044091b950b7cc565d2
```

## Adding the brunch build command as a npm post-install command

```json
# package.json
{
  "dependencies": {
    ...
  },
  "engines": {
    "node": "~ 0.12.1"
  },
  "scripts": {
    "postinstall": "node_modules/.bin/brunch build"  
  }
}
```

## Adding the Database_url extraction method to the prod_secret.exs

```elixir
defmodule Heroku do
  def database_config(uri) do
    parsed_uri = URI.parse(uri)
    [username, password] = parsed_uri.userinfo
                          |> String.split(":")
    [_, database] = parsed_uri.path
                    |> String.split("/")

    [{:username, username},
     {:password, password},
     {:hostname, parsed_uri.host},
     {:database, database},
     {:port, parsed_uri.port},
     {:adapter, Ecto.Adapters.Postgres}]
  end
end
```

```elixir
# Configure your database
config :librarian, Librarian.Repo,
  "DATABASE_URL"
  |> System.get_env
  |> Heroku.database_config
```

## Run the database migrations

```bash
heroku run mix ecto.migrate
```