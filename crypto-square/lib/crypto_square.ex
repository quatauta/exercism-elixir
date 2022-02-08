defmodule CryptoSquare do
  @moduledoc false

  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""

  def encode(str) do
    str |> normalize() |> square() |> crypt()
  end

  defp normalize(str), do: str |> String.downcase() |> String.replace(~r/[^a-z0-9]/, "")

  defp columns(str) do
    str |> String.length() |> :math.sqrt() |> ceil()
  end

  defp square(str) do
    columns = columns(str)

    str
    |> String.graphemes()
    |> Enum.chunk_every(columns, columns, Stream.cycle([" "]))
    |> Enum.zip()
  end

  defp crypt(square) do
    Enum.map_join(square, " ", &(&1 |> Tuple.to_list() |> Enum.join()))
  end
end
