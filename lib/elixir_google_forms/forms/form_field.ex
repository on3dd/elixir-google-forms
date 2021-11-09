defmodule ElixirGoogleForms.Forms.FormField do
  use Ecto.Schema
  import Ecto.Changeset

  schema "form_fields" do
    field :title, :string
    field :value, :string
    field :form_id, :id

    timestamps()
  end

  @doc false
  def changeset(form_field, attrs) do
    form_field
    |> cast(attrs, [:title, :value])
    |> validate_required([:title, :value])
  end
end
