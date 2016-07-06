# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

alias UploadTest.Repo
alias UploadTest.User

[
  %{
    email: "admin@example.com",
    password: "password"
  },
]
|> Enum.map(&User.changeset(%User{}, &1))
|> Enum.each(&Repo.insert!(&1))