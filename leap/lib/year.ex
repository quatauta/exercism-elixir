defmodule Year do
  @moduledoc false

  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    div_by_4 = 0 == Integer.mod(year, 4)
    div_by_100 = 0 == Integer.mod(year, 100)
    div_by_400 = 0 == Integer.mod(year, 400)

    div_by_4 && (!div_by_100 || div_by_400)
  end
end
