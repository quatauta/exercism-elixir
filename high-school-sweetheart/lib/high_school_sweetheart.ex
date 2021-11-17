defmodule HighSchoolSweetheart do
  @moduledoc false

  @spec first_letter(String.t()) :: String.grapheme() | nil
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  @spec initial(String.t()) :: String.t()
  def initial(name) do
    initial = name |> first_letter |> String.upcase()
    "#{initial}."
  end

  @spec initials(String.t()) :: String.t()
  def initials(full_name) do
    full_name
    |> String.trim()
    |> String.split()
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  @spec pair(String.t(), String.t()) :: String.t()
  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *

    i1 = initials(full_name1)
    i2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
