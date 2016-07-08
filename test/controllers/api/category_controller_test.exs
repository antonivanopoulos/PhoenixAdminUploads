defmodule UploadTest.CategoryControllerTest do
  use UploadTest.ConnCase

  test "GET index", %{conn: conn} do
    conn = get conn, "/api/categories"
    assert json_response(conn, 200)
  end

  # test "GET show", %{conn: conn} do
  #   conn = get conn, "/api/categories"
  #   assert json_response(conn, 200)
  # end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, category_path(conn, :show, -1)
    end
  end
end
