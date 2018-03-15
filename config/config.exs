# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :proxy_protocol_demo,
  ecto_repos: [ProxyProtocolDemo.Repo]

# Configures the endpoint
config :proxy_protocol_demo, ProxyProtocolDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O5seC4khxA52oyzbwzJKiSf0pe9ypRYdFbhGGXOhHpXqQZKcwzyLLsglxBJTz0yq",
  render_errors: [view: ProxyProtocolDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProxyProtocolDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
