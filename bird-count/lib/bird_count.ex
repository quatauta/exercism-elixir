defmodule BirdCount do
  @moduledoc false

  @spec today([integer()]) :: number() | nil
  def today([]), do: nil
  def today([head | _]), do: head

  @spec increment_day_count([integer()]) :: [integer()]
  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  @spec has_day_without_birds?([integer()]) :: boolean()
  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | tail]) do
    if head == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  @spec total([integer()]) :: integer()
  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  @spec busy_days([integer()]) :: integer()
  def busy_days([]), do: 0

  def busy_days([head | tail]) do
    if head >= 5 do
      1
    else
      0
    end + busy_days(tail)
  end
end
