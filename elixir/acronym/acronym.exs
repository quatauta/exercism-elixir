defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string |> split |> filter_words |> abbreviate_words |> upcase
  end

  defp split(string) do
    String.split(string, ~r/(\p{Lu}+|\p{Lu}?\p{Ll}+)(?=\p{Lu}|\b)/, include_captures: true)
  end

  defp filter_words(list), do: Enum.filter(list, fn word -> word =~ ~r/^\p{L}/ end)

  defp abbreviate_words([head | tail]), do: abbreviate_word(head) <> abbreviate_words(tail)
  defp abbreviate_words([]), do: ""

  defp abbreviate_word(word), do: word |> String.first

  defp upcase(string), do: String.upcase(string)
end
