defmodule FreelancerRates do
  @moduledoc false

  @spec daily_rate(number) :: float
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  @spec apply_discount(number, number) :: float
  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  @spec monthly_rate(number, number) :: integer
  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> Kernel.*(22)
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc
  end

  @spec days_in_budget(number, number, number) :: float
  def days_in_budget(budget, hourly_rate, discount) do
    discounted_daily_rate = hourly_rate |> daily_rate |> apply_discount(discount)
    budget |> Kernel./(discounted_daily_rate) |> Float.floor(1)
  end
end
