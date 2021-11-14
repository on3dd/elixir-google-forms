defmodule ElixirGoogleForms.Forms.Form do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "forms" do
    field :active_until, :utc_datetime
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(form, attrs) do
    form
    |> cast(attrs, [:name, :active_until])
    |> validate_required([:name, :active_until])
  end
end
