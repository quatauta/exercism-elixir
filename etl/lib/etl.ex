defmodule ETL do
  @moduledoc false

  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map :: %{integer() => [char()]}) :: %{char() => integer()}
  def transform(input) do
    Enum.reduce(input, %{}, fn {score, letters}, acc ->
      Enum.reduce(letters, acc, fn letter, acc ->
        Map.put(acc, String.downcase(letter), score)
      end)
    end)
  end
end
