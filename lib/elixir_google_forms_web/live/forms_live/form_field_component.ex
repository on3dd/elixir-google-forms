defmodule ElixirGoogleFormsWeb.FormsLive.FormFieldComponent do
  use ElixirGoogleFormsWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <label>
        <%= text_input @form, @form_field.title %>
      </label>
    </div>
    """
  end
end
