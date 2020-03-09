# PhxLiveMnesia

This is a fairly barebones scaffold of a Phoenix application. It is based on Phoenix 1.4 and the main differences are:

  * Ecto/Postgres not initialized
  * Liveview Setup
  * Mnesia included

See the instructions at the bottom to change the project name after downloading this repo.


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Preparing Project For your Use

  * Change the signing salts in your config/ files
  * For linux, run the following commands to change your project name:
	```
	find ./ -type f -exec sed -i 's/:phx_live_mnesia string/:my_app/g' {} \;
	find ./ -type f -exec sed -i 's/:PhxLiveMnesia string/MyApp/g' {} \;
	```

  * Optionally rename the folders in lib to your app name.

Much easier than setting up liveview! At least until a phx version includes it.
