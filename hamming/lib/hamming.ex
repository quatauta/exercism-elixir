defmodule Hamming do
  @moduledoc false

  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: hamming_helper(strand1, strand2, 0)

  defp hamming_helper([], [], acc), do: {:ok, acc}
  defp hamming_helper([_ | _], [], _), do: {:error, "strands must be of equal length"}
  defp hamming_helper([], [_ | _], _), do: {:error, "strands must be of equal length"}
  defp hamming_helper([head | tail1], [head | tail2], acc), do: hamming_helper(tail1, tail2, acc)
  defp hamming_helper([_ | tail1], [_ | tail2], acc), do: hamming_helper(tail1, tail2, 1 + acc)
end
