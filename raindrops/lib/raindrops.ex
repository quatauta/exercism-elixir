defmodule Raindrops do
  @moduledoc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    raindrops = pling(number) <> plang(number) <> plong(number)

    if raindrops == "" do
      Integer.to_string(number)
    else
      raindrops
    end
  end

  defp pling(number) when 0 == rem(number, 3), do: "Pling"
  defp pling(_), do: ""

  defp plang(number) when 0 == rem(number, 5), do: "Plang"
  defp plang(_), do: ""

  defp plong(number) when 0 == rem(number, 7), do: "Plong"
  defp plong(_), do: ""
end
