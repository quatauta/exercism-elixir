defmodule RomanNumerals do
  @symbols [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  @moduledoc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number <= 0, do: ""

  def numeral(number) do
    [value, symbol] = Enum.find(@symbols, 1, fn pair -> Enum.at(pair, 0) <= number end)
    symbol <> numeral(number - value)
  end
end
