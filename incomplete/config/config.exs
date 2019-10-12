# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :e2e_with_cypress, E2eWithCypressWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qd8FcYmvuiX2gYJoXmRrvIGj8q1osuqnFK7WIrJFpZhD7/zJrMgLfwEYIAu4go2G",
  render_errors: [view: E2eWithCypressWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: E2eWithCypress.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :e2e_with_cypress, E2eWithCypressWeb.Endpoint,
  live_view: [
    signing_salt: "SECRET_SALT"
  ]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
