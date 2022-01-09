defmodule PascalsTriangle do
  @moduledoc false

  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    [1] |> Stream.unfold(&{&1, next_row(&1)}) |> Enum.take(num)
  end

  defp next_row(row) do
    next_row = Enum.concat(row, [1])
    length = length(next_row)

    Enum.with_index(next_row, fn element, index ->
      if index > 0 && index < length - 1 do
        Enum.at(next_row, index - 1) + element
      else
        element
      end
    end)
  end
end
