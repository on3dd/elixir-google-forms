defmodule ElixirGoogleForms.Repo do
  use Ecto.Repo,
    otp_app: :elixir_google_forms,
    adapter: Ecto.Adapters.Postgres
end
