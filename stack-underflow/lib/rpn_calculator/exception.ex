defmodule RPNCalculator.Exception do
  @moduledoc false

  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl Exception
    def exception(value) do
      case value do
        [] ->
          %__MODULE__{}
        _ ->
          %__MODULE__{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  @spec divide([number, ...]) :: float
  def divide([]), do: raise StackUnderflowError, "when dividing"
  def divide([_]), do: raise StackUnderflowError, "when dividing"
  def divide([0 | _]), do: raise DivisionByZeroError
  def divide([divisor, dividend]), do: Kernel./(dividend, divisor)
end
