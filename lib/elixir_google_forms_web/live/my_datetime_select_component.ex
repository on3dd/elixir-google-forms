defmodule ElixirGoogleFormsWeb.MyDatetimeSelectComponent do
  use ElixirGoogleFormsWeb, :live_component

  @impl true
  def mount(socket) do
    opts = [
      year: my_datetime_select_year_options(),
      month: my_datetime_select_month_options(),
      day: my_datetime_select_day_options(),
      time: my_datetime_select_time_options(),
    ]

    {:ok, assign(socket, opts: opts)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <%= datetime_select @form, @field, builder: fn b -> %>
    Date:
    <%= b.(:day, @opts[:day]) %> /
    <%= b.(:month, @opts[:month]) %> /
    <%= b.(:year, @opts[:year]) %>
    Time:
    <%= b.(:hour, @opts[:time]) %> :
    <%= b.(:minute, @opts[:time]) %>
    <% end %>
    """
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

  defp current_year(), do: DateTime.utc_now().year

  defp active_until_year_range() do
    with year <- current_year() do
      year..(year + 10)
    end
  end
end
