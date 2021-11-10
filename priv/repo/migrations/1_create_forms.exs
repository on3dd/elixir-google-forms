defmodule ElixirGoogleForms.Repo.Migrations.CreateForms do
  use Ecto.Migration

  def change do
    create table(:forms) do
      add :name, :string
      add :active_until, :utc_datetime

      timestamps()
    end
  end
end
