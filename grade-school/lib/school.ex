defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    if exists?(db, name) do
      db
    else
      Map.update(db, grade, [name], fn list -> [name | list] |> Enum.uniq() |> Enum.sort() end)
    end
  end

  defp exists?(db, name) do
    db |> Map.values() |> Enum.any?(&Enum.member?(&1, name))
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    db[grade] || []
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    db |> Map.to_list() |> List.keysort(0)
  end
end
