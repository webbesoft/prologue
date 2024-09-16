defmodule Prologue.Repo do
  use Ecto.Repo,
    otp_app: :prologue,
    adapter: Ecto.Adapters.Postgres
end
