defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count([head | tail], nucleotide) do
    (if head == nucleotide, do: 1, else: 0) + count(tail, nucleotide)
  end

  def count([], _) do
    0
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram([head | tail]) do
    histogram(tail) |> Map.get_and_update(head, &({ &1, &1 + 1 })) |> elem(1)
  end

  def histogram([]) do
    Enum.reduce(@nucleotides, %{}, &(Map.put(&2, &1, 0)))
  end
end