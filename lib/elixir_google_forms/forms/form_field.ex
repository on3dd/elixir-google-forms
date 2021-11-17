defmodule ElixirGoogleForms.Forms.FormField do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :title, :string
    field :type, :string, default: "text"
    field :delete, :boolean, virtual: true
  end

  @doc false
  def changeset(form_field, %{"delete" => "true"}) do
    %{Ecto.Changeset.change(form_field, delete: true) | action: :delete}
  end

  @doc false
  def changeset(form_field, attrs) do
    form_field
    |> cast(attrs, [:title, :type])
    |> validate_required([:title])
  end
end
