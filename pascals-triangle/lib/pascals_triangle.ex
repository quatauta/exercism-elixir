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
    [0 | row]
    |> Enum.chunk_every(2, 1, [0])
    |> Enum.map(&Enum.sum/1)
  end
end
