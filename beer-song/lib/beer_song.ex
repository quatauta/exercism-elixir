defmodule BeerSong do
  @moduledoc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    String.capitalize(bottles(number)) <>
      " of beer on the wall, " <>
      bottles(number) <>
      " of beer.\n" <>
      take(number) <> ", " <> more(number) <> ".\n"
  end

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(number), do: Integer.to_string(number) <> " bottles"

  defp take(0), do: "Go to the store and buy some more"
  defp take(1), do: "Take it down and pass it around"
  defp take(_), do: "Take one down and pass it around"

  defp more(0), do: "99 bottles of beer on the wall"
  defp more(1), do: "no more bottles of beer on the wall"
  defp more(2), do: "1 bottle of beer on the wall"
  defp more(number), do: Integer.to_string(number - 1) <> " bottles of beer on the wall"

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range), do: Enum.map_join(range, "\n", &verse/1)

  @spec lyrics() :: String.t()
  def lyrics, do: lyrics(99..0)
end
