defmodule ResistorColorDuo do
  @moduledoc false

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors |> Enum.take(2) |> Enum.map(&(color_value(&1) + ?0)) |> List.to_integer()
  end

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
