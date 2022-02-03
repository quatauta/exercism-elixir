defmodule Allergies do
  @moduledoc false
  use Bitwise

  @allergies %{
    1 => "eggs",
    2 => "peanuts",
    4 => "shellfish",
    8 => "strawberries",
    16 => "tomatoes",
    32 => "chocolate",
    64 => "pollen",
    128 => "cats"
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    Enum.reduce(@allergies, [], fn {flag, allergy}, acc ->
      if Bitwise.band(flags, flag) == flag do
        [allergy | acc]
      else
        acc
      end
    end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    flags |> list() |> Enum.any?(&(&1 == item))
  end
end
