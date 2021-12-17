defmodule SumOfMultiples do
  @moduledoc false

  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(&(&1 |> multiples(limit) |> Enum.to_list()))
    |> List.flatten()
    |> MapSet.new()
    |> Enum.sum()
  end

  defp multiples(0, _), do: [0]

  defp multiples(factor, limit) do
    factor..(limit - 1)//factor
  end
end
