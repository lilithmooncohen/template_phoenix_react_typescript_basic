import Config

# Configure your database
config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}.Repo,
  username: "postgres",
  password: "postgres",
  database: "{{ cookiecutter.app_name }}_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
