defmodule Username do
  @moduledoc false

  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize([]), do: []

  def sanitize([first | tail]) do
    case first do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      first when ?a <= first and first <= ?z -> [first]
      _ -> ''
    end ++ sanitize(tail)
  end
end
