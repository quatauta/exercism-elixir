defmodule GuessingGame do
  @moduledoc false

  @spec compare(integer, integer | atom) :: String.t()
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, secret_number), do: "Correct"

  def compare(secret_number, guess) when is_number(guess) and secret_number + 1 < guess,
    do: "Too high"

  def compare(secret_number, guess) when is_number(guess) and guess < secret_number - 1,
    do: "Too low"

  def compare(secret_number, guess)
      when is_number(guess) and (guess == secret_number - 1 or secret_number + 1 == guess),
      do: "So close"

  def compare(_, _), do: "Make a guess"
end
