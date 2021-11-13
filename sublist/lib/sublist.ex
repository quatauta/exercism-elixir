defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list, list) :: :equal | :sublist | :superlist | :unequal
  def compare(a, a), do: :equal

  def compare(a, b) do
    cond do
      includes?(b, a) -> :sublist
      includes?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp includes?([], _), do: false

  defp includes?([_head | tail] = a, b) do
    List.starts_with?(a, b) or includes?(tail, b)
  end
end
