# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}Web.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [
    host: System.get_env("ENDPOINT_URL_HOST") || "localhost",
    port:
      String.to_integer(System.get_env("ENDPOINT_URL_PORT") || System.get_env("PORT") || "4000")
  ],
  check_origin: false,
  secret_key_base: secret_key_base

# Do not print debug messages in production
config :logger, level: :info
config :{{ cookiecutter.app_name }}, {{ cookiecutter.module_name }}Web.Endpoint, server: true
