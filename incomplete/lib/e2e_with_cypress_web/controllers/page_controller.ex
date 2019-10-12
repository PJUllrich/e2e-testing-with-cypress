defmodule E2eWithCypressWeb.PageController do
  use E2eWithCypressWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
