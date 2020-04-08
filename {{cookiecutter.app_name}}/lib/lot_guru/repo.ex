defmodule {{ cookiecutter.module_name }}.Repo do
  use Ecto.Repo,
    otp_app: :{{ cookiecutter.app_name }},
    adapter: Ecto.Adapters.Postgres
end
