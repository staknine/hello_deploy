# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :hello_deploy,
  ecto_repos: [HelloDeploy.Repo]

# Configures the endpoint
config :hello_deploy, HelloDeployWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HelloDeployWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloDeploy.PubSub,
  live_view: [signing_salt: "7mGH+JcB"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :hello_deploy, HelloDeploy.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :logger,
  # or other Logger level
  level: :info,
  backends: [LogflareLogger.HttpBackend]

config :logflare_logger_backend,
  # https://api.logflare.app is configured by default and you can set your own url
  url: "https://api.logflare.app",
  # Default LogflareLogger level is :info. Note that log messages are filtered by the :logger application first
  level: :info,
  # your Logflare API key, found on your dashboard
  api_key: "...",
  # the Logflare source UUID, found  on your Logflare dashboard
  source_id: "...",
  # minimum time in ms before a log batch is sent
  flush_interval: 1_000,
  # maximum number of events before a log batch is sent
  max_batch_size: 50,
  # optionally you can drop keys if they exist with `metadata: [drop: [:list, :keys, :to, :drop]]`
  metadata: :all

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
