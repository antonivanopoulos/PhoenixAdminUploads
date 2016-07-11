defmodule UploadTest.SessionController do
  use UploadTest.Web, :controller

  alias UploadTest.User
  alias UploadTest.UserQuery

  plug :scrub_params, "session" when action in [:create]

  def new(conn, _params) do
    render conn, :new, [email: ""]
  end

  def create(conn, %{"session" => session_params}) do
    case UploadTest.Session.authenticate(session_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Logged in.")
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: admin_path(conn, :dashboard))
      :error ->
        render(conn, :new, [email: session_params['email']])
    end
  end

  def destroy(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: session_path(conn, :new))
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:info, "You need to sign in.")
    |> redirect(to: session_path(conn, :new))
  end
end