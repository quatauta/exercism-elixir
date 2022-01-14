defmodule Proverb do
  @moduledoc false

  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""

  def recite([head | _] = strings) do
    for_want = strings |> Enum.chunk_every(2, 1, :discard) |> Enum.map(&for_want/1)
    Enum.join(for_want ++ [and_all(head)], "")
  end

  defp for_want([first | [second]]), do: "For want of a #{first} the #{second} was lost.\n"
  defp and_all(string), do: "And all for the want of a #{string}.\n"
end
