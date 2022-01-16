defmodule Say do
  @moduledoc false

  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number < 0 or number > 999_999_999_999,
    do: {:error, "number is out of range"}

  def in_english(number) do
    number |> tripples() |> Enum.map(&tripple_in_english/1)
  end

  defp tripples(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.chunk_every(3, 3, [0, 0, 0])
    |> Enum.map(&Enum.reverse/1)
    |> Enum.reverse()
  end

  defp tripple_in_english([hundrets, tens, ones]) do
    "#{hundrets} #{tens} #{ones}"
  end
end
