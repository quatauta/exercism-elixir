defmodule MatchingBrackets do
  @moduledoc false

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    helper(str, [])
  end

  defp helper("", brackets), do: Enum.empty?(brackets)

  defp helper(<<?(, rest::binary>>, brackets), do: helper(rest, ["(" | brackets])
  defp helper(<<?{, rest::binary>>, brackets), do: helper(rest, ["{" | brackets])
  defp helper(<<?[, rest::binary>>, brackets), do: helper(rest, ["[" | brackets])

  defp helper(<<?), rest::binary>>, ["(" | brackets]), do: helper(rest, brackets)
  defp helper(<<?}, rest::binary>>, ["{" | brackets]), do: helper(rest, brackets)
  defp helper(<<?], rest::binary>>, ["[" | brackets]), do: helper(rest, brackets)

  defp helper(<<?), _::binary>>, _), do: false
  defp helper(<<?}, _::binary>>, _), do: false
  defp helper(<<?], _::binary>>, _), do: false

  defp helper(<<_, rest::binary>>, brackets), do: helper(rest, brackets)
end
