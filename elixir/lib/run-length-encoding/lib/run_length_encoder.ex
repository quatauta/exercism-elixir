defmodule RunLengthEncoder do
  @moduledoc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(nil), do: ""
  def encode(""), do: ""

  def encode(string) do
    {head, tail} = String.next_grapheme(string)
    encode_helper(tail, head, 1)
  end

  defp encode_helper("", grapheme, count), do: encode_print(grapheme, count)

  defp encode_helper(string, grapheme, count) do
    {head, tail} = String.next_grapheme(string)

    if grapheme == head do
      encode_helper(tail, grapheme, count + 1)
    else
      encode_print(grapheme, count) <> encode(string)
    end
  end

  defp encode_print(grapheme, 1), do: grapheme

  defp encode_print(grapheme, count) do
    Integer.to_string(count) <> grapheme
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""

  def decode(string) do
    Regex.scan(~r/(\d*)(\D)/i, string)
    |> Enum.map(fn e ->
      [_, n, s] = e
      decode_print(n, s)
    end)
    |> Enum.join()
  end

  defp decode_print("", string), do: string
  defp decode_print(0, _), do: ""
  defp decode_print(1, string), do: string
  defp decode_print(n, string), do: String.duplicate(string, String.to_integer(n))
end
