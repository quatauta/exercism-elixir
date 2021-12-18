defmodule Atbash do
  @moduledoc false

  @forward Enum.map(Enum.concat(?a..?z, ?0..?9), &<<&1>>)
  @reverse Enum.map(Enum.concat(?z..?a, ?0..?9), &<<&1>>)
  @encode Map.new(Enum.zip(@forward, @reverse))
  @decode Map.new(Enum.zip(@reverse, @forward))

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(&Map.get(@encode, &1))
    |> Enum.filter(& &1)
    |> Enum.chunk_every(5)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map_join(&Map.get(@decode, &1))
  end
end
