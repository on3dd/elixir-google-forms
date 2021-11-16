defmodule ElixirGoogleForms.Utils.Validation do
  import Ecto.Changeset

  def validate_current_or_future_date(%{changes: changes} = changeset, field) do
    if date = changes[field] do
      do_validate_current_or_future_date(changeset, field, date)
    else
      changeset
    end
  end

  defp do_validate_current_or_future_date(changeset, field, date) do
    today = DateTime.utc_now()

    if DateTime.compare(date, today) == :lt do
      changeset
      |> add_error(field, "date in the past")
    else
      changeset
    end
  end
end
