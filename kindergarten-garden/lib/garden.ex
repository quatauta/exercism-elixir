defmodule Garden do
  @moduledoc false

  @plants %{"C" => :clover, "G" => :grass, "R" => :radishes, "V" => :violets}

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(
        info_string,
        student_names \\ [
          :alice,
          :bob,
          :charlie,
          :david,
          :eve,
          :fred,
          :ginny,
          :harriet,
          :ileana,
          :joseph,
          :kincaid,
          :larry
        ]
      ) do
    garden = String.split(info_string)

    student_names
    |> Enum.sort()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {name, index}, map -> Map.put(map, name, plants_at(garden, index)) end)
  end

  defp plants_at(garden, index) do
    a = garden |> Enum.at(0) |> String.at(index * 2)
    b = garden |> Enum.at(0) |> String.at(index * 2 + 1)
    c = garden |> Enum.at(1) |> String.at(index * 2)
    d = garden |> Enum.at(1) |> String.at(index * 2 + 1)

    [
      Map.get(@plants, a),
      Map.get(@plants, b),
      Map.get(@plants, c),
      Map.get(@plants, d)
    ]
    |> Enum.filter(& &1)
    |> List.to_tuple()
  end
end
