defmodule ResistorColorTrio do
  @moduledoc false

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    [first, second, exponent] = Enum.map(colors, &color_value/1)
    resistance = resistance(first, second, exponent)
    (resistance >= 1000 && {resistance / 1000, :kiloohms}) || {resistance, :ohms}
  end

  defp resistance(first, second, exponent), do: (first * 10 + second) * 10 ** exponent
  defp color_value(:black), do: 0
  defp color_value(:brown), do: 1
  defp color_value(:red), do: 2
  defp color_value(:orange), do: 3
  defp color_value(:yellow), do: 4
  defp color_value(:green), do: 5
  defp color_value(:blue), do: 6
  defp color_value(:violet), do: 7
  defp color_value(:grey), do: 8
  defp color_value(:white), do: 9
end
