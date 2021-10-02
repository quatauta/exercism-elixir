defmodule BinarySearch do
  @moduledoc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found

  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  @spec search(tuple, integer, integer, integer) :: {:ok, integer} | :not_found
  defp search({}, _, _, _), do: :not_found
  defp search({key}, key, _, _), do: {:ok, 0}
  defp search(numbers, key, _, last) when key > elem(numbers, last), do: :not_found
  defp search(numbers, key, first, _) when key < elem(numbers, first), do: :not_found

  defp search(numbers, key, first, last) do
    median_position = first + div(last - first, 2)
    median = elem(numbers, median_position)

    cond do
      key == median -> {:ok, median_position}
      key < median -> search(numbers, key, first, max(first, median_position - 1))
      key > median -> search(numbers, key, min(median_position + 1, last), last)
    end
  end
end
