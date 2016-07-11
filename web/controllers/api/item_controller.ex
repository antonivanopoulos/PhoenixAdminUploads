defmodule UploadTest.ItemController do
  use UploadTest.Web, :controller
  alias UploadTest.Repo
  alias UploadTest.Item

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated, handler: UploadTest.Api.SessionController

  def index(conn, %{"category_id" => category_id}) do
    query = from i in Item,
              where: i.category_id == ^(category_id),
              select: i

    items = Repo.all(query)
    render conn, items: items
  end

  def show(conn, %{"id" => item_id}) do
    item = Repo.get!(Item, item_id)
    render conn, item: item
  end
end
