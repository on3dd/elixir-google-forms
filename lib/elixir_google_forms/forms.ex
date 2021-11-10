defmodule ElixirGoogleForms.Forms do
  @moduledoc """
  The Forms context.
  """

  import Ecto.Query, warn: false
  alias ElixirGoogleForms.Repo

  alias ElixirGoogleForms.Forms.Form

  @doc """
  Returns the list of forms.

  ## Examples

      iex> list_forms()
      [%Form{}, ...]

  """
  def list_forms do
    Repo.all(Form)
  end

  @doc """
  Gets a single form.

  Raises `Ecto.NoResultsError` if the Form does not exist.

  ## Examples

      iex> get_form!(123)
      %Form{}

      iex> get_form!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form!(id), do: Repo.get!(Form, id)

  @doc """
  Creates a form.

  ## Examples

      iex> create_form(%{field: value})
      {:ok, %Form{}}

      iex> create_form(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form(attrs \\ %{}) do
    %Form{}
    |> Form.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form.

  ## Examples

      iex> update_form(form, %{field: new_value})
      {:ok, %Form{}}

      iex> update_form(form, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form(%Form{} = form, attrs) do
    form
    |> Form.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a form.

  ## Examples

      iex> delete_form(form)
      {:ok, %Form{}}

      iex> delete_form(form)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form(%Form{} = form) do
    Repo.delete(form)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form changes.

  ## Examples

      iex> change_form(form)
      %Ecto.Changeset{data: %Form{}}

  """
  def change_form(%Form{} = form, attrs \\ %{}) do
    Form.changeset(form, attrs)
  end

  alias ElixirGoogleForms.Forms.FormField

  @doc """
  Returns the list of form_fields.

  ## Examples

      iex> list_form_fields()
      [%FormField{}, ...]

  """
  def list_form_fields do
    Repo.all(FormField)
  end

  @doc """
  Returns the list of form_fields by form id.

  ## Examples

      iex> list_form_fields_by_id(id)
      [%FormField{}, ...]

  """
  def list_form_fields_by_id(id) do
    from(f in FormField, where: f.form_id == ^id) |> Repo.all()
  end

  @doc """
  Gets a single form_field.

  Raises `Ecto.NoResultsError` if the Form field does not exist.

  ## Examples

      iex> get_form_field!(123)
      %FormField{}

      iex> get_form_field!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form_field!(id), do: Repo.get!(FormField, id)

  @doc """
  Creates a form_field.

  ## Examples

      iex> create_form_field(%{field: value})
      {:ok, %FormField{}}

      iex> create_form_field(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form_field(attrs \\ %{}) do
    %FormField{}
    |> FormField.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form_field.

  ## Examples

      iex> update_form_field(form_field, %{field: new_value})
      {:ok, %FormField{}}

      iex> update_form_field(form_field, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form_field(%FormField{} = form_field, attrs) do
    form_field
    |> FormField.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a form_field.

  ## Examples

      iex> delete_form_field(form_field)
      {:ok, %FormField{}}

      iex> delete_form_field(form_field)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form_field(%FormField{} = form_field) do
    Repo.delete(form_field)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form_field changes.

  ## Examples

      iex> change_form_field(form_field)
      %Ecto.Changeset{data: %FormField{}}

  """
  def change_form_field(%FormField{} = form_field, attrs \\ %{}) do
    FormField.changeset(form_field, attrs)
  end
end
