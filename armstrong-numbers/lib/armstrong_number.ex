defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    power = length(digits)
    powers = Enum.map(digits, &Kernel.**(&1, power))
    sum = Enum.sum(powers)

    number == sum
  end
end
