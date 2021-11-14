defmodule ElixirGoogleForms.Repo.Migrations.CreateForms do
  use Ecto.Migration

  def change do
    create table(:forms)
  end
end
