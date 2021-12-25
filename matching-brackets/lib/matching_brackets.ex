defmodule MatchingBrackets do
  @moduledoc false

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    check(str, [])
  end

  defp check("", brackets), do: Enum.empty?(brackets)

  defp check("(" <> tail, brackets), do: check(tail, ["(" | brackets])
  defp check("{" <> tail, brackets), do: check(tail, ["{" | brackets])
  defp check("[" <> tail, brackets), do: check(tail, ["[" | brackets])

  defp check(")" <> tail, ["(" | brackets]), do: check(tail, brackets)
  defp check("}" <> tail, ["{" | brackets]), do: check(tail, brackets)
  defp check("]" <> tail, ["[" | brackets]), do: check(tail, brackets)

  defp check(")" <> _, _), do: false
  defp check("}" <> _, _), do: false
  defp check("]" <> _, _), do: false

  defp check(<<_, tail::binary>>, brackets), do: check(tail, brackets)
end
