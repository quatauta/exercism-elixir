defmodule Username do
  @moduledoc false

  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize([]), do: []
  def sanitize([first | tail]) when first == ?ä, do: 'ae' ++ sanitize(tail)
  def sanitize([first | tail]) when first == ?ö, do: 'oe' ++ sanitize(tail)
  def sanitize([first | tail]) when first == ?ü, do: 'ue' ++ sanitize(tail)
  def sanitize([first | tail]) when first == ?ß, do: 'ss' ++ sanitize(tail)

  def sanitize([first | tail]) when first == ?_ or (?a <= first and first <= ?z),
    do: [first | sanitize(tail)]

  def sanitize([_ | tail]), do: sanitize(tail)
end
