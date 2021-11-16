defmodule ElixirGoogleForms.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirGoogleForms.Forms.FormField

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "forms" do
    field :active_until, :utc_datetime
    field :name, :string
    embeds_many :form_fields, FormField

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :active_until])
    |> cast_embed(:form_fields)
    |> validate_required([:name, :active_until])
  end

  def put_form_fields_in_changeset(changeset, form_fields) do
    IO.puts("put_field_to_changeset")
    IO.inspect(form_fields, label: "inspecting form_fields")

    put_embed(changeset, :form_fields, form_fields)
  end
end
