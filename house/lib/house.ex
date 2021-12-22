defmodule House do
  @moduledoc false

  @phrases Enum.reverse([
             # This is
             "the horse and the hound and the horn that belonged to",
             "the farmer sowing his corn that kept",
             "the rooster that crowed in the morn that woke",
             "the priest all shaven and shorn that married",
             "the man all tattered and torn that kissed",
             "the maiden all forlorn that milked",
             "the cow with the crumpled horn that tossed",
             "the dog that worried",
             "the cat that killed",
             "the rat that ate",
             "the malt that lay in",
             "the house that Jack built."
           ])

  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    Enum.map_join(start..stop, "", &verse/1)
  end

  defp verse(number) do
    "This is " <> Enum.map_join((number - 1)..0, " ", &Enum.at(@phrases, &1)) <> "\n"
  end
end
