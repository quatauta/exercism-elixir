defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices("", _), do: []
  def slices(_, size) when size < 1, do: []
  def slices(s, 1), do: String.graphemes(s)

  def slices(s, size) do
    cond do
      String.length(s) >= size ->
        [
          String.slice(s, 0, size)
          | slices(String.slice(s, 1, String.length(s) - 1), size)
        ]

      true ->
        []
    end
  end
end
