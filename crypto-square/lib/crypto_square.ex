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

  defp square(str) do
    columns = str |> String.length() |> :math.sqrt() |> ceil()

    str
    |> String.graphemes()
    |> Enum.chunk_every(columns, columns, Stream.cycle([" "]))
    |> Stream.zip_with(&Enum.join/1)
  end

  defp normalize(str), do: str |> String.downcase() |> String.replace(~r/[^a-z0-9]/, "")

  defp crypt(square), do: Enum.join(square, " ")
end
