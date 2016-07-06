defmodule UploadTest.PageController do
  use UploadTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
