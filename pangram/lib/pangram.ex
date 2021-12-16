defmodule Pangram do
  @moduledoc false

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    Enum.empty?(Enum.to_list(?a..?z) -- to_charlist(String.downcase(sentence)))
  end
end
