defmodule RotationalCipher do
  @moduledoc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(<<char>> <> tail, shift) do
    <<rotate_char(char, shift)>> <> rotate(tail, shift)
  end

  def rotate(_, _), do: ""

  def rotate_char(char, shift) when char >= ?a and char <= ?z do
    ?a + rem(char - ?a + shift, ?z - ?a + 1)
  end

  def rotate_char(char, shift) when char >= ?A and char <= ?Z do
    ?A + rem(char - ?A + shift, ?Z - ?A + 1)
  end

  def rotate_char(char, _), do: char
end
