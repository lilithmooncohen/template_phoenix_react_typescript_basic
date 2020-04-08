# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :{{ cookiecutter.app_name }},
  ecto_repos: [{{ cookiecutter.module_name }}.Repo]

# Configures the endpoint
config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HJgo2Yijt7PV44KEN0e+FbnmFxaKcvdBTFXfzMBetcv9EvkUWs6Jee4hPD4kWvd7",
  render_errors: [view: {{ cookiecutter.module_name }}Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: {{ cookiecutter.module_name }}.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "KrdUeAuv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
