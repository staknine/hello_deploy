defmodule HelloDeployWeb.PageController do
  use HelloDeployWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
