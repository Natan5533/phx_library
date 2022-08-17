defmodule PhxLibrary.Repo do
  use Ecto.Repo,
    otp_app: :phx_library,
    adapter: Ecto.Adapters.Postgres
end
