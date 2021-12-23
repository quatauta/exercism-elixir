defmodule Isogram do
  @moduledoc false

  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[[:space:][:punct:]]/, "")
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.all?(fn {_, f} -> f == 1 end)
  end
end
