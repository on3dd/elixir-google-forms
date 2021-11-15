defmodule ElixirGoogleForms.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGoogleForms.Forms.FormField

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "forms" do
    field :active_until, :utc_datetime
    field :name, :string
    embeds_many :fields, FormField

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :active_until])
    |> cast_embed(:fields, required: true)
    |> validate_required([:name, :active_until])
  end

  def add_field_to_changeset(%{changes: %{fields: fields}} = changeset) do
    IO.puts("add_field_to_changeset case 1")
    put_field_to_changeset(changeset, fields)
  end

  def add_field_to_changeset(%{data: %{fields: fields}} = changeset) do
    IO.puts("add_field_to_changeset case 2")
    put_field_to_changeset(changeset, fields)
  end

  defp put_field_to_changeset(changeset, fields) do
    IO.inspect(fields, label: "fields in put_field_to_changeset")

    put_embed(changeset, :fields, fields ++ [%FormField{title: ""}])
  end
end
