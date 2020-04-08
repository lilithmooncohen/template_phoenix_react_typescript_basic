defmodule {{ cookiecutter.module_name }}Web.ErrorView do
  use {{ cookiecutter.module_name }}Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Server internal error"
  end


  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end

defmodule {{ cookiecutter.module_name }}Web.PageView do
  use {{ cookiecutter.module_name }}Web, :view
end
