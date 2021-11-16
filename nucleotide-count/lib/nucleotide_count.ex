defmodule NucleotideCount do
  @moduledoc false

  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count([], _), do: 0

  def count([head | tail], nucleotide) do
    ((nuceotide?(head) && head == nucleotide && 1) || 0) + count(tail, nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand), do: histogram_count(strand)

  defp histogram_count(strand) do
    @nucleotides
    |> Enum.map(fn nucleotide -> {nucleotide, count(strand, nucleotide)} end)
    |> Map.new()
  end

  defp nuceotide?(char) when char in @nucleotides, do: true
  defp nuceotide?(_), do: false
end
