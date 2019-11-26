defmodule Roman do
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

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when number <= 0, do: ""

  def numerals(number) when number > 0 do
    [value, symbol] = Enum.find(@symbols, 1, fn pair -> Enum.at(pair, 0) <= number end)
    symbol <> numerals(number - value)
  end
end
