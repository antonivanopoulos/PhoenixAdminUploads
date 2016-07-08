defmodule UploadTest.Resource do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original]

  def acl(:original, _), do: :authenticated_read
end
