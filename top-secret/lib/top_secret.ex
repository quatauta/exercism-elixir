defmodule TopSecret do
  @moduledoc false

  @spec to_ast(string :: String.t()) :: ast :: Macro.t()
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  @spec decode_secret_message_part(ast :: Macro.t(), accumlator :: list()) ::
          {ast :: Macro.t(), accumulator :: list()}
  def decode_secret_message_part({atom, _, args} = ast, acc) when atom in [:def, :defp] do
    {name, args} = function_name_and_args(args)
    msg = secret_message_from_function(name, args)
    {ast, [msg | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  @spec decode_secret_message(string :: String.t()) :: String.t()
  def decode_secret_message(string) do
    {_, acc} = string |> to_ast() |> Macro.prewalk([], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join()
  end

  defp function_name_and_args(args) do
    case args do
      [{:when, _, args} | _] -> function_name_and_args(args)
      [{name, _, args} | _] when is_list(args) -> {name, args}
      [{name, _, args} | _] when is_atom(args) -> {name, []}
    end
  end

  defp function_arity([]), do: 0
  defp function_arity(args), do: length(args)

  defp secret_message_from_function(name, args) do
    String.slice(to_string(name), 0, function_arity(args))
  end
end
