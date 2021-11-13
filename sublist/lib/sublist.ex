defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare([], []) :: :equal
  @spec compare([], list) :: :sublist
  @spec compare(list, []) :: :superlist
  @spec compare(a :: nonempty_list, b :: nonempty_list) :: atom
  def compare([], []), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist

  def compare(a, b) do
    if a == b do
      :equal
    else
      if Sublist.includes?(b, a) do
        :sublist
      else
        if Sublist.includes?(a, b) do
          :superlist
        else
          :unequal
        end
      end
    end
  end

  @spec includes?([], any) :: false
  @spec includes?(a :: nonempty_list, b :: nonempty_list) :: boolean
  def includes?([], _), do: false
  def includes?([head | tail], b) do
    if List.starts_with?([head | tail], b) do
      true
    else
      includes?(tail, b)
    end
  end
end
