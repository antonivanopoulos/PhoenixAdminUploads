defimpl ExAdmin.Authentication, for: Plug.Conn do
  alias UploadTest.Router.Helpers
  alias Guardian.Plug, as: Auth

  def use_authentication?(_), do: true
  def current_user(conn), do: Auth.current_resource(conn)
  def current_user_name(conn), do: "user" #Auth.current_resource(conn).email
  def session_path(conn, action), do: Helpers.session_path(conn, action)
end
