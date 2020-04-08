defmodule {{ cookiecutter.module_name }}Web.PageController do
  use {{ cookiecutter.module_name }}Web, :controller

  def index(conn, _params) do
    html(conn, File.read!(Application.app_dir(:{{ cookiecutter.app_name }}, "./priv/static/index.html")))
  end
end
