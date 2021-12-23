defmodule Garden do
  @moduledoc false

  @plants %{"C" => :clover, "G" => :grass, "R" => :radishes, "V" => :violets}
  @students [
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

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    garden = String.split(info_string)

    student_names
    |> Enum.sort()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {name, index}, map -> Map.put(map, name, plants_at(garden, index)) end)
  end

  defp plants_at(garden, index) do
    [
      Map.get(@plants, String.at(Enum.at(garden, 0), index * 2)),
      Map.get(@plants, String.at(Enum.at(garden, 0), index * 2 + 1)),
      Map.get(@plants, String.at(Enum.at(garden, 1), index * 2)),
      Map.get(@plants, String.at(Enum.at(garden, 1), index * 2 + 1))
    ]
    |> Enum.filter(& &1)
    |> List.to_tuple()
  end
end
