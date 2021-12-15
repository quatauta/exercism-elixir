defmodule Prime do
  @moduledoc false

  @doc """
  Generates the nth prime.
  """
  @spec nth(count :: non_neg_integer) :: prime :: non_neg_integer
  def nth(count) when is_integer(count) and 0 < count do
    2
    |> Stream.iterate(&(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Stream.drop(count - 1)
    |> Enum.at(0)
  end

  defp prime?(2), do: true
  defp prime?(n) when n < 2 or rem(n, 2) == 0, do: false
  defp prime?(n), do: prime?(n, 3)
  defp prime?(n, k) when n < k * k, do: true
  defp prime?(n, k) when rem(n, k) == 0, do: false
  defp prime?(n, k), do: prime?(n, k + 2)
end
