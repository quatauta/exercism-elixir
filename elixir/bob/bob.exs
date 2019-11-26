defmodule Bob do
  @spec hey(imput :: String.t()) :: String.t()
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      yelling_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty?(input), do: input =~ ~r/^\s*$/u
  defp question?(input), do: input =~ ~r/\?$/
  defp yelling?(input), do: input =~ ~r/^\P{Ll}*\p{Lu}+\P{Ll}*$/u
  defp yelling_question?(input), do: input =~ ~r/^\P{Ll}*\p{Lu}+\P{Ll}*\?$/u
end
