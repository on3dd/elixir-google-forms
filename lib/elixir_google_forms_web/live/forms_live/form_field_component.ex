defmodule ElixirGoogleFormsWeb.FormsLive.FormFieldComponent do
  use ElixirGoogleFormsWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.form
        let={f}
        for={@changeset}
        as="form_field"
        phx-target={@myself}
        phx-change="update_form_field"
      >
        <label>
          <%= @idx %>. <%= text_input f, :title %>
        </label>
      </.form>
    </div>
    """
  end

  @impl true
  def handle_event("update_form_field", %{"form_field" => form_params}, socket) do
    IO.inspect(form_params, label: "form_params in update_form_field")
    IO.inspect(socket.assigns, label: "socket.assigns in update_form_field")

    %{"title" => title} = form_params

    changeset =
      socket.assigns.changeset
      |> Ecto.Changeset.change(title: title)

    {:noreply, assign(socket, :changeset, changeset)}
  end
end
