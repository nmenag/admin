# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :admin,
  ecto_repos: [Admin.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [html: AdminWeb.ErrorHTML, json: AdminWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Admin.PubSub,
  live_view: [signing_salt: "OwQBpbSe"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :admin, Admin.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :kaffy,
  # required keys
  # required
  otp_app: :admin,
  # required
  ecto_repo: Admin.Repo,
  # required
  router: AdminWeb.Router,
  # optional keys
  admin_title: "My Awesome App",
  hide_dashboard: false,
  # home_page: [schema: [:accounts, :user]],
  # since v0.10.0
  enable_context_dashboards: true,
  # since v0.10.0
  admin_footer: "Kaffy &copy; 2023",
  extensions: [
    Admin.Kaffy.Extension
  ]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
