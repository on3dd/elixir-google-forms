defmodule ElixirGoogleForms.Repo.Migrations.CreateFormFields do
  use Ecto.Migration

  def change do
    create table(:form_fields) do
      add :title, :string
      add :value, :string
      add :form_id, references(:forms, on_delete: :nothing)

      timestamps()
    end

    create index(:form_fields, [:form_id])
  end
end
