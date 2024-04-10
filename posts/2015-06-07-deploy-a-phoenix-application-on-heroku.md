Date: 2015-06-07
Title: Deploy a Phoenix Application on Heroku
Tags: Phoenix, Elixir, Heroku
Comments: true

Since I heard of [Phoenix](http://www.phoenixframework.org/), the [Elixir](http://elixir-lang.org/) framework on [The Changelog Podcast](https://changelog.com/147/), I've spent some time getting familiar with the framework.
However when time came to deploy the application onto Heroku there were a couple of things that weren't initially obvious to me, like how to run [brunch](http://brunch.io/) to compile the assets or how to parse the `DATABASE_URL` environment variable.

## Buildpacks

First we have to change the currently used buildpack to the multi buildpack which makes it possible to run the Node.js besides the Elixir buildpack.

```bash
heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
```

Then add the file `.buildpacks` with the contents below which will pull in the buildpacks and run their compile script. The buildpack listed last will hereby be used to run the application.

```
# .buildpacks
https://github.com/heroku/heroku-buildpack-nodejs.git#34cffc9b6397bc1ce97a4b5e911fa771fc4e7907
https://github.com/HashNuke/heroku-buildpack-elixir.git#36f2ff22d0236589256d9044091b950b7cc565d2
```

## Compile the assets

Now that we have multiple buildpacks we need to tell the Node.js one to run the `postinstall` hook after all the dependencies are installed. Just add the `scripts` part to your `package.json` and you're all set for Heroku to run the `brunch build` command.

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

## Parse the environment variable

When deploying the application to Heroku, the configuration variables will be exposed to the application via environment variables. For the database that means there will be a single String from which the `username`, `password`, `host`, etc. will have to be extracted. You could theoretically do that by hand defining those variables individually, however what happens if your database provider has an issue and suddenly decides to change the value behind your environment variable? - in order to avoid that, just put the code below in your `prod.secret.exs` file to help you split the configuration variable for the database.

```elixir
# config/prod.secret.exs
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

Then instead of defining the arguments for your app separately, call the `database_config` function and you're all set.

```elixir
# config/prod.secret.exs
config :yourapplication, Yourapplication.Repo,
  "DATABASE_URL"
  |> System.get_env
  |> Heroku.database_config
```

## Run the database migrations

```bash
heroku run mix ecto.migrate
```

Since I'm pretty new to Elixir and even newer to the Phoenix Framework, this tutorial might lack some best practices, in which case please let me know so this post can be updated to reflect them.
