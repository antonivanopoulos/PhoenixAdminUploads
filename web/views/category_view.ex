defmodule UploadTest.CategoryView do
  use UploadTest.Web, :view

  def render("index.json", %{categories: categories}) do
    %{categories: categories}
  end

  def render("show.json", %{category: category}) do
    %{category: category}
  end
end
