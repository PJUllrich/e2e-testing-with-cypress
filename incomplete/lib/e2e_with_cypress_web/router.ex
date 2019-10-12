defmodule E2eWithCypressWeb.Router do
  use E2eWithCypressWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", E2eWithCypressWeb do
    pipe_through :browser

    live "/", IndexLive, session: %{}
  end

  # Other scopes may use custom stacks.
  # scope "/api", E2eWithCypressWeb do
  #   pipe_through :api
  # end
end
