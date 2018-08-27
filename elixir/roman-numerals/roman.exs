defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    mils  = number - Integer.mod(number, 1000)
    cents = number - mils - Integer.mod(number, 100)
    tens  = number - mils - cents - Integer.mod(number, 10)
    ones  = number - mils - cents - tens

    symbol(mils) <> symbol(cents) <> symbol(tens) <> symbol(ones)
  end

  defp symbol(3000), do: "MMM"
  defp symbol(2000), do: "MM"
  defp symbol(1000), do: "M"

  defp symbol(900), do: "CM"
  defp symbol(800), do: "DCCC"
  defp symbol(700), do: "DCC"
  defp symbol(600), do: "DC"
  defp symbol(500), do: "D"
  defp symbol(400), do: "CD"
  defp symbol(300), do: "CCC"
  defp symbol(200), do: "CC"
  defp symbol(100), do: "C"

  defp symbol(90), do: "XC"
  defp symbol(80), do: "LXXX"
  defp symbol(70), do: "LXX"
  defp symbol(60), do: "LX"
  defp symbol(50), do: "L"
  defp symbol(40), do: "XL"
  defp symbol(30), do: "XXX"
  defp symbol(20), do: "XX"
  defp symbol(10), do: "X"

  defp symbol(9), do: "IX"
  defp symbol(8), do: "VIII"
  defp symbol(7), do: "VII"
  defp symbol(6), do: "VI"
  defp symbol(5), do: "V"
  defp symbol(4), do: "IV"
  defp symbol(3), do: "III"
  defp symbol(2), do: "II"
  defp symbol(1), do: "I"

  defp symbol(_), do: ""
end
