defmodule PerfectNumbers do
  @moduledoc false

  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number <= 0, do: {:error, "Classification is only possible for natural numbers."}
  def classify(number) when number >= 1 do
    aliquot_sum = aliquot_sum(number)
    cond do
      aliquot_sum == number -> {:ok, :perfect}
      aliquot_sum < number -> {:ok, :deficient}
      number < aliquot_sum -> {:ok, :abundant}
    end
  end

  defp aliquot_sum(number), do: number |> factors() |> Enum.reverse() |> tl() |> Enum.sum()
  defp factors(n), do: n |> factors(1, []) |> Enum.sort()
  defp factors(n, i, factors) when n < i * i, do: factors
  defp factors(n, i, factors) when n == i * i, do: [i | factors]
  defp factors(n, i, factors) when rem(n, i) == 0, do: factors(n, i + 1, [i, div(n, i) | factors])
  defp factors(n, i, factors), do: factors(n, i + 1, factors)
end
