defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase |> split |> translate_words |> join
  end

  defp split(phrase), do: String.split(phrase)

  defp translate_words([]), do: []

  defp translate_words([head | tail]), do: [translate_word(head)] ++ translate_words(tail)

  defp join(list), do: Enum.join(list, " ")

  defp translate_word(word) do
    Regex.replace(~r/^((s?qu|.*?))(([xy][^aeiuo]|[aeiuo])+)(.*?)$/u, word, "\\3\\5\\1ay")
  end
end
