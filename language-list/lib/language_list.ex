defmodule LanguageList do
  @moduledoc false

  @spec new :: []
  def new() do
    []
  end

  @spec add(list, any) :: nonempty_maybe_improper_list
  def add(list, language) do
    [language | list]
  end

  @spec remove(maybe_improper_list) :: any
  def remove([]), do: []

  def remove([_ | tail]) do
    tail
  end

  @spec first(maybe_improper_list) :: any
  def first([]), do: nil

  def first([head | _]) do
    head
  end

  @spec count(list) :: non_neg_integer
  def count([]), do: 0

  def count([_ | tail]) do
    1 + count(tail)
  end

  @spec exciting_list?(maybe_improper_list) :: boolean
  def exciting_list?([]), do: false
  def exciting_list?(["Elixir" | _]), do: true
  def exciting_list?([_ | tail]), do: exciting_list?(tail)
end
