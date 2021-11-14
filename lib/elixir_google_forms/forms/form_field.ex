# TODO: consider to remove this one
defmodule ElixirGoogleForms.Forms.FormField do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
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
