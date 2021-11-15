defmodule ElixirGoogleForms.Forms.FormField do
  use Ecto.Schema

  embedded_schema do
    field :title, :string
    field :type, :string
  end
end
