defmodule ElixirGoogleForms.Forms.FormField do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :title, :string, default: ""
    field :type, :string, default: "text"
  end

  @doc false
  def changeset(form_field, attrs) do
    form_field
    |> cast(attrs, [:title, :type])
    # |> validate_required([:title])
  end
end
