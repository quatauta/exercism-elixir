defmodule Say do
  @moduledoc false

  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number < 0 or number > 999_999_999_999,
    do: {:error, "number is out of range"}

  def in_english(number) do
    tripples =
      number
      |> tripples()
      |> Enum.map(&tripple_in_english/1)
      |> Enum.map(&((&1 != [] && &1) || nil))

    hundreds = Enum.at(tripples, 0)
    tausands = Enum.at(tripples, 1)
    millions = Enum.at(tripples, 2)
    billions = Enum.at(tripples, 3)

    number_in_english =
      [
        billions |> scaled("billion"),
        millions |> scaled("million"),
        tausands |> scaled("thousand"),
        hundreds |> scaled(nil)
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(" ")

    {:ok, number_in_english}
  end

  defp scaled(nil, _), do: nil
  defp scaled([], _), do: nil
  defp scaled("", _), do: nil
  defp scaled(number, nil), do: "#{number}"
  defp scaled(number, ""), do: "#{number}"
  defp scaled(number, word), do: "#{number} #{word}"

  defp tripples(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.chunk_every(3, 3, [nil, nil, nil])
    |> Enum.map(&Enum.reverse/1)
  end

  defp tripple_in_english([hundreds, tens, ones]) do
    [hundreds_in_english(hundreds), tens_in_english(tens, ones)]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  defp ones_in_english(nil), do: nil
  defp ones_in_english(0), do: "zero"
  defp ones_in_english(1), do: "one"
  defp ones_in_english(2), do: "two"
  defp ones_in_english(3), do: "three"
  defp ones_in_english(4), do: "four"
  defp ones_in_english(5), do: "five"
  defp ones_in_english(6), do: "six"
  defp ones_in_english(7), do: "seven"
  defp ones_in_english(8), do: "eight"
  defp ones_in_english(9), do: "nine"

  defp tens_in_english(nil, nil), do: nil
  defp tens_in_english(0, 0), do: nil
  defp tens_in_english(tens, ones) when tens in [0, nil], do: ones_in_english(ones)
  defp tens_in_english(tens, 0), do: tens_in_english(tens)
  defp tens_in_english(1, 1), do: "eleven"
  defp tens_in_english(1, 2), do: "twelve"
  defp tens_in_english(1, 3), do: "thirteen"
  defp tens_in_english(1, 4), do: "fourteen"
  defp tens_in_english(1, 5), do: "fifteen"
  defp tens_in_english(1, ones), do: ones_in_english(ones) <> "teen"
  defp tens_in_english(tens, ones), do: tens_in_english(tens) <> "-" <> ones_in_english(ones)

  defp tens_in_english(1), do: "ten"
  defp tens_in_english(2), do: "twenty"
  defp tens_in_english(3), do: "thirty"
  defp tens_in_english(4), do: "forty"
  defp tens_in_english(5), do: "fifty"
  defp tens_in_english(6), do: "sixty"
  defp tens_in_english(7), do: "seventy"
  defp tens_in_english(8), do: "eighty"
  defp tens_in_english(9), do: "ninety"

  defp hundreds_in_english(nil), do: nil
  defp hundreds_in_english(0), do: nil
  defp hundreds_in_english(number), do: ones_in_english(number) <> " hundred"
end
