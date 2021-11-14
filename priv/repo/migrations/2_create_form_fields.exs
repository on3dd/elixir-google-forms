defmodule ElixirGoogleForms.Repo.Migrations.CreateFormFields do
  use Ecto.Migration

  def change do
    create table(:form_fields)
    create index(:form_fields, [:form_id])
  end
end
