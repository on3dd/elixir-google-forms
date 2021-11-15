defmodule ElixirGoogleFormsWeb.FormsLive.FormComponent do
  use ElixirGoogleFormsWeb, :live_component

  alias ElixirGoogleForms.Forms

  @impl true
  def update(%{form: form} = assigns, socket) do
    changeset = Forms.change_form(form)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"form" => form_params}, socket) do
    IO.inspect(form_params, label: "form_params")

    changeset =
      socket.assigns.form
      |> Forms.change_form(form_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"form" => form_params}, socket) do
    save_form(socket, socket.assigns.action, form_params)
  end

  def handle_event("add_form_field", params, socket) do
    IO.inspect(params, label: "inspecting params")
    IO.inspect(socket.assigns.changeset, label: "inspecting socket.assigns.changeset")

    changeset =
      socket.assigns.changeset
      |> Forms.add_form_field()

    {:noreply, assign(socket, :changeset, changeset)}
  end

  defp indexed_fields(%{changes: %{fields: fields}}) do
    Enum.with_index(fields, 1)
  end

  defp indexed_fields(_), do: []

  defp save_form(socket, :edit, form_params) do
    case Forms.update_form(socket.assigns.form, form_params) do
      {:ok, _form} ->
        {:noreply,
         socket
         |> put_flash(:info, "Form updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_form(socket, :new, form_params) do
    case Forms.create_form(form_params) do
      {:ok, _form} ->
        {:noreply,
         socket
         |> put_flash(:info, "Form created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
