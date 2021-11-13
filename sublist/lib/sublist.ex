defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare([], list) :: :sublist
  @spec compare(list, []) :: :superlist
  @spec compare(a :: nonempty_list, b :: nonempty_list) :: atom
  def compare(a, a), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist

  def compare(a, b) do
    cond do
      includes?(b, a) -> :sublist
      includes?(a, b) -> :superlist
      true -> :unequal
    end
  end

  @spec includes?([], any) :: false
  @spec includes?(a :: nonempty_list, b :: nonempty_list) :: boolean
  defp includes?([], _), do: false
  defp includes?([head | tail], b) do
    if List.starts_with?([head | tail], b) do
      true
    else
      includes?(tail, b)
    end
  end
end
