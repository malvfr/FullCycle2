# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :catalogo_videos_backend,
  ecto_repos: [CatalogoVideosBackend.Repo]

config :catalogo_videos_backend, CatalogoVideosBackend.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :catalogo_videos_backend, CatalogoVideosBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w5qVWShWdvKt4q2N/NXtKZ817Gf8+YHkxii0zSKyegY2k7mH1W7tQ5cR0We+vvAZ",
  render_errors: [view: CatalogoVideosBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CatalogoVideosBackend.PubSub,
  live_view: [signing_salt: "QP2HrSNq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
