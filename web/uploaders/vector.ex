defmodule UploadTest.Vector do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original]
  @extension_whitelist ~w(.svg)

  def acl(:original, _), do: :authenticated_read

  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname |> String.downcase
    Enum.member?(@extension_whitelist, file_extension)
  end
end
