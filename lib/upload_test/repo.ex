defmodule UploadTest.Repo do
  use Ecto.Repo, otp_app: :upload_test
  use Scrivener, page_size: 10
end
