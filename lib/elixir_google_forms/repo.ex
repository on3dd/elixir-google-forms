defmodule ElixirGoogleForms.Repo do
  use Ecto.Repo,
    otp_app: :elixir_google_forms,
    adapter: Mongo.Ecto
end
