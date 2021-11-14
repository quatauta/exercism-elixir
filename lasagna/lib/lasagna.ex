defmodule Lasagna do
  @moduledoc false

  @spec expected_minutes_in_oven :: 40
  def expected_minutes_in_oven, do: 40

  @spec remaining_minutes_in_oven(number) :: number
  def remaining_minutes_in_oven(minutes_in_oven_already) do
    expected_minutes_in_oven() - minutes_in_oven_already
  end

  @spec preparation_time_in_minutes(number) :: number
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  @spec total_time_in_minutes(number, number) :: number
  def total_time_in_minutes(layers, minutes_in_oven_already) do
    preparation_time_in_minutes(layers) + minutes_in_oven_already
  end

  @spec alarm :: String.t()
  def alarm, do: "Ding!"
end
