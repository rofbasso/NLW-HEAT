import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :heat_tags_elixir, HeatTagsElixir.Repo,
  username: "postgres",
  password: "postgres",
  database: "heat_tags_elixir_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :heat_tags_elixir, HeatTagsElixirWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Q0osORU1bXBZV0OUKkAsfoh7KpQGCbZPeAOqjzT2gAw0vv2hVSFj/q/alAzErUPn",
  server: false

# In test we don't send emails.
config :heat_tags_elixir, HeatTagsElixir.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
