defmodule UploadTest.CategoryController do
  use UploadTest.Web, :controller
  alias UploadTest.Repo
  alias UploadTest.Category

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated, handler: UploadTest.Api.SessionController

  def index(conn, _params) do
    categories = Repo.all(Category)
    render conn, categories: categories
  end

  def show(conn, %{"id" => category_id}) do
    category = Repo.get!(Category, category_id)
    render conn, category: category
  end
end
