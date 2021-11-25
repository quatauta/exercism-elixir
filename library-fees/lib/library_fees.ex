defmodule LibraryFees do
  @moduledoc false

  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  @spec before_noon?(datetime :: NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime) do
    datetime.hour < 12
  end

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    days_to_return = (before_noon?(checkout_datetime) && 28) || 29
    Date.add(checkout_datetime, days_to_return)
  end

  @spec days_late(planned_return_date :: Date.t(), actual_return_date :: NaiveDateTime.t()) ::
          non_neg_integer()
  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime |> Date.diff(planned_return_date) |> max(0)
  end

  @spec monday?(datetime :: NaiveDateTime.t()) :: boolean()
  def monday?(datetime) do
    Date.day_of_week(datetime, :monday) == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), number) :: number
  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)
    days = checkout |> datetime_from_string() |> return_date() |> days_late(return_datetime)
    fee = days * rate * ((monday?(return_datetime) && 0.5) || 1.0)
    trunc(fee)
  end
end
