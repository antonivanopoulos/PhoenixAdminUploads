defmodule UploadTest.ItemView do
  use UploadTest.Web, :view

  def render("index.json", %{items: items}) do
    %{items: items}
  end

  def render("show.json", %{item: item}) do
    %{item: item}
  end
end
