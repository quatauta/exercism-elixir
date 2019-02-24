use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    codes = %{
      0b0001 => "wink",
      0b0010 => "double blink",
      0b0100 => "close your eyes",
      0b1000 => "jump",
    }

    handshake = Enum.map(codes, fn {k, v} -> if (code &&& k) == k, do: v end)
    handshake = Enum.reject(handshake, &is_nil/1)

    cond do
      (code &&& 16) == 16 -> Enum.reverse(handshake)
      true -> handshake
    end
  end
end
