defmodule Matrix do
  @moduledoc false

  @type t :: [[integer()]]

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: Matrix.t()
  def from_string(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn row -> row |> String.split() |> Enum.map(&String.to_integer/1) end)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: Matrix.t()) :: String.t()
  def to_string(matrix) do
    matrix |> rows() |> Enum.map_join("\n", &Enum.join(&1, " "))
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: Matrix.t()) :: list(list(integer))
  def rows(matrix) do
    matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: Matrix.t(), index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(matrix, index - 1)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: Matrix.t()) :: list(list(integer))
  def columns(matrix) do
    count = matrix |> rows() |> List.first() |> length()
    Enum.map(1..count, &(column(matrix, &1)))
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: Matrix.t(), index :: integer) :: list(integer)
  def column(matrix, index) do
    Enum.map(matrix, &(Enum.at(&1, index - 1)))
  end
end
