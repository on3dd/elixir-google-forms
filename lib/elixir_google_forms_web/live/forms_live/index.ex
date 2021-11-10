defmodule ElixirGoogleFormsWeb.FormsLive.Index do
  use ElixirGoogleFormsWeb, :live_view

  alias ElixirGoogleForms.Forms
  alias ElixirGoogleForms.Forms.Form

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :forms, list_forms())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Form")
    |> assign(:form, Forms.get_form!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Form")
    |> assign(:form, %Form{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Forms")
    |> assign(:form, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    form = Forms.get_form!(id)
    {:ok, _} = Forms.delete_form(form)

    {:noreply, assign(socket, :forms, list_forms())}
  end

  defp list_forms do
    Forms.list_forms()
  end
end
