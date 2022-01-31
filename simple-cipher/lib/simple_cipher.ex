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
    rotate(plaintext, key, :forward)
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
  @spec decode(String.t(), String.t()) :: String.t()
  def decode(ciphertext, key) do
    rotate(ciphertext, key, :backward)
  end

  @doc """
  Generate a random key of a given length. It should contain lowercase letters only.
  """
  @spec generate_key(integer()) :: String.t()
  def generate_key(length) do
    1..length |> Enum.map(fn _ -> Enum.random(?a..?z) end) |> List.to_string()
  end

  defp rotate(plaintext, key, direction) when is_binary(plaintext) and is_binary(key) do
    key_stream = Stream.cycle(String.to_charlist(key))

    plaintext
    |> String.to_charlist()
    |> Enum.zip_reduce(key_stream, [], &(&3 ++ [rotate(&1, &2, direction)]))
    |> to_string()
  end

  defp rotate(plain_char, key_char, direction) do
    p = plain_char - ?a
    k = key_char - ?a
    n = (direction == :forward && p + k) || p - k
    ?a + Integer.mod(n, 26)
  end
end
