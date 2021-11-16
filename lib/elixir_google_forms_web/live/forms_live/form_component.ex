defmodule ElixirGoogleFormsWeb.FormsLive.FormComponent do
  use ElixirGoogleFormsWeb, :live_component

  alias ElixirGoogleForms.Forms
  alias ElixirGoogleForms.Forms.FormField

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
    IO.puts("validate")
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

  def handle_event("add_form_field", _, socket) do
    IO.puts("add_form_field")
    IO.inspect(socket.assigns.changeset, label: "inspecting socket.assigns.changeset")

    existing_form_fields =
      Map.get(socket.assigns.changeset.changes, :form_fields, socket.assigns.form.form_fields)

    new_form_variant = Forms.change_form_field(%FormField{})

    changeset =
      socket.assigns.changeset
      |> Forms.put_form_fields_in_changeset(existing_form_fields ++ [new_form_variant])

    {:noreply, assign(socket, :changeset, changeset)}
  end

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
