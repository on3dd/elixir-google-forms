defmodule ElixirGoogleForms.FormsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirGoogleForms.Forms` context.
  """

  @doc """
  Generate a form.
  """
  def form_fixture(attrs \\ %{}) do
    {:ok, form} =
      attrs
      |> Enum.into(%{
        active_until: ~U[2021-11-08 05:35:00Z],
        name: "some name"
      })
      |> ElixirGoogleForms.Forms.create_form()

    form
  end

  @doc """
  Generate a form_field.
  """
  def form_field_fixture(attrs \\ %{}) do
    {:ok, form_field} =
      attrs
      |> Enum.into(%{
        title: "some title",
        value: "some value"
      })
      |> ElixirGoogleForms.Forms.create_form_field()

    form_field
  end
end
