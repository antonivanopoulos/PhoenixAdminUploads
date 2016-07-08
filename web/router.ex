defmodule UploadTest.Router do
  use UploadTest.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated, handler: UploadTest.SessionController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UploadTest do
    pipe_through :browser
  end

  scope "/admin", UploadTest do
    pipe_through :browser

    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create
    patch "/sign_out", SessionController, :destroy
    delete "/sign_out", SessionController, :destroy
  end

  scope "/admin", ExAdmin do
    pipe_through [:browser, :admin]
    admin_routes
  end

  scope "/api", UploadTest do
    pipe_through :api

    resources "/categories", CategoryController, only: [:index, :show] do
      resources "/items", ItemController, only: [:index, :show]
    end
  end
end
