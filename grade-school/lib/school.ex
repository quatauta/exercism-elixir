defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """
  @type school :: list()
  @doc """
  Create a new, empty school.
  """
  @spec new() :: school()
  def new(), do: []

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school(), String.t(), integer()) :: {:ok | :error, school()}
  def add(school, name, grade) do
    if name in roster(school),
      do: {:error, school},
      else: {:ok, [%{name: name, grade: grade} | school]}
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school(), integer()) :: [String.t()]
  def grade(school, grade),
    do: school |> Enum.filter(fn student -> student.grade == grade end) |> roster()

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school()) :: [String.t()]
  def roster(school), do: school |> Enum.sort_by(&{&1.grade, &1.name}) |> Enum.map(& &1.name)
end
