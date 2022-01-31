defmodule SimpleCipher do
  @moduledoc false

  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  @spec encode(String.t(), String.t()) :: String.t()
  def encode(plaintext, key) do
    k = enlarge_key(key, String.length(plaintext))
    plaintext |> String.to_charlist() |> rotate(k) |> to_string()
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key) do
    k = enlarge_key(key, String.length(ciphertext))
    ciphertext |> String.to_charlist() |> rotate(k, :backward) |> to_string()
  end

  @doc """
  Generate a random key of a given length. It should contain lowercase letters only.
  """
  @spec generate_key(integer()) :: String.t()
  def generate_key(length) do
    1..length |> Enum.map(fn _ -> ?a + :rand.uniform(26) - 1 end) |> List.to_string()
  end

  defp rotate(plain, key, direction \\ :forward)
  defp rotate([], _, _), do: []
  defp rotate([plain | pt], [key | kt], direction) do
    p = plain - ?a
    k = key - ?a
    n = direction == :forward && p + k || p - k
    r = ?a + Integer.mod(n, 26)
    [r | rotate(pt, kt, direction)]
  end

  defp enlarge_key(key, length) do
    key |> String.duplicate(trunc(Float.ceil(length / String.length(key)))) |> String.to_charlist()
  end
end
