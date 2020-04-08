defmodule {{ cookiecutter.module_name }}Web.Router do
  use {{ cookiecutter.module_name }}Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  scope "/", {{ cookiecutter.module_name }}Web do
    pipe_through :browser

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", {{ cookiecutter.module_name }}Web do
  #   pipe_through :api
  # end
end
