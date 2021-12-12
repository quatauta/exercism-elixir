defmodule AllYourBase do
  @moduledoc false

  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}

  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}

  def convert(digits, input_base, output_base) do
    if Enum.all?(digits, &digit?(&1, input_base)) do
      {:ok, digits |> to_integer(input_base) |> to_digits(output_base)}
    else
      {:error, "all digits must be >= 0 and < input base"}
    end
  end

  @spec digit?(digit :: integer(), base :: integer()) :: boolean()
  defp digit?(digit, base), do: 0 <= digit and digit < base

  @spec to_integer(digits :: [integer()], base :: integer(), integer :: integer()) :: integer()
  defp to_integer(digits, base, integer \\ 0)
  defp to_integer([], _, integer), do: integer

  defp to_integer([digit | tail], base, integer) do
    to_integer(tail, base, integer * base + digit)
  end

  @spec to_digits(integer :: integer(), base :: integer(), digits :: [integer()]) :: [integer()]
  defp to_digits(integer, base, digits \\ [])
  defp to_digits(0, _, []), do: [0]
  defp to_digits(0, _, digits), do: digits

  defp to_digits(integer, base, digits) do
    next_divisor = div(integer, base)
    new_digits = [rem(integer, base) | digits]
    to_digits(next_divisor, base, new_digits)
  end
end
