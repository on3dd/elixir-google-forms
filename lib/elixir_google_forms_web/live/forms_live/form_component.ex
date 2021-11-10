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
    changeset =
      socket.assigns.form
      |> Forms.change_form(form_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"form" => form_params}, socket) do
    save_form(socket, socket.assigns.action, form_params)
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

  # TODO: consider moving to separate file
  def my_datetime_select(form, field, opts \\ []) do
    opts =
      opts
      |> Keyword.put(:year, my_datetime_select_year_options())
      |> Keyword.put(:month, my_datetime_select_month_options())
      |> Keyword.put(:day, my_datetime_select_day_options())
      |> Keyword.put(:hour, my_datetime_select_time_options())
      |> Keyword.put(:minute, my_datetime_select_time_options())

    datetime_select(form, field, [builder: my_datetime_select_builder()] ++ opts)
  end

  defp my_datetime_select_builder() do
    fn b ->
      ~e"""
      Date: <%= b.(:day, []) %> / <%= b.(:month, []) %> / <%= b.(:year, []) %>
      Time: <%= b.(:hour, []) %> : <%= b.(:minute, []) %>
      """
    end
  end

  defp my_datetime_select_year_options() do
    [default: to_string(current_year()), options: active_until_year_range()]
  end

  defp my_datetime_select_month_options() do
    [
      options: [
        {gettext("January"), "1"},
        {gettext("February"), "2"},
        {gettext("March"), "3"},
        {gettext("April"), "4"},
        {gettext("May"), "5"},
        {gettext("June"), "6"},
        {gettext("July"), "7"},
        {gettext("August"), "8"},
        {gettext("September"), "9"},
        {gettext("October"), "10"},
        {gettext("November"), "11"},
        {gettext("December"), "12"}
      ]
    ]
  end

  defp my_datetime_select_day_options(), do: [default: "01"]
  defp my_datetime_select_time_options(), do: [default: "00"]

  def current_year(), do: DateTime.utc_now().year

  def active_until_year_range() do
    with year <- current_year() do
      year..(year + 10)
    end
  end
end
