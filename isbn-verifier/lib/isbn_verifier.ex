defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    dashless = isbn |> String.replace("-", "") |> String.downcase()

    if String.match?(dashless, ~r/^[0-9]{9}[0-9x]$/) do
      dashless
      |> String.graphemes()
      |> Enum.map(&to_integer/1)
      |> Enum.zip(10..1)
      |> Enum.reduce(0, fn {digit, multiplier}, acc -> acc + digit * multiplier end)
      |> Integer.mod(11) == 0
    end
  end

  defp to_integer("x"), do: 10
  defp to_integer(digit), do: String.to_integer(digit)
end
