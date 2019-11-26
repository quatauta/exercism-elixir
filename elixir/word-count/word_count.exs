defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    downcase(sentence) |> split() |> count_words()
  end

  defp downcase(sentence) do
    String.downcase(sentence)
  end

  defp split(sentence) do
    String.split(sentence, ~r/[^\pL\pN-]/u, trim: true)
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, fn word, count -> increment(word, count) end)
  end

  def increment(word, count) do
    Map.update(count, word, 1, fn word_count -> word_count + 1 end)
  end
end
