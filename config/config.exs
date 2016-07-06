# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :upload_test,
  ecto_repos: [UploadTest.Repo]

# Configures the endpoint
config :upload_test, UploadTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EmMVukkGIRGZNZ4DVTATuvrsGEAbSyBHhvupKyNvRiuJ35K9nHDIekVeBjPt+9G0",
  render_errors: [view: UploadTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UploadTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure admin tools
config :ex_admin,
  repo: UploadTest.Repo,
  module: UploadTest,
  modules: [
    UploadTest.ExAdmin.Dashboard,
  ]

# Configure Guardian
config :guardian, Guardian,
  issuer: "UploadTest",
  ttl: { 30, :days },
  secret_key: "be5UGhgCkWXd0dQjCEHEiC/VjWqeg6fdsZAA7FKWVDK3mApMpJL18PuLuwuMFcsI",
  serializer: UploadTest.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

