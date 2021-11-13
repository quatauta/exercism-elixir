defmodule Anagram do
  @moduledoc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_downcase = String.downcase(base)
    base_codepoints = Enum.sort(String.codepoints(base_downcase))

    Enum.filter(candidates, fn candidate ->
      candidate_downcase = String.downcase(candidate)
      candidate_codepoints = Enum.sort(String.codepoints(candidate_downcase))

      base_downcase != candidate_downcase &&
        base_codepoints == candidate_codepoints
    end)
  end
end
