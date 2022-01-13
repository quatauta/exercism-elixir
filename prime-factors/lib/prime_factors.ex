defmodule PrimeFactors do
  @moduledoc false

  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(n) do
    factors(n, 2)
  end

  defp factors(1, _), do: []
  defp factors(n, divisor) when divisor * divisor > n, do: [n]

  defp factors(n, divisor) when rem(n, divisor) == 0,
    do: [divisor | factors(div(n, divisor), divisor)]

  defp factors(n, divisor), do: factors(n, divisor + 1)
end
