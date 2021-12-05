defmodule RPNCalculator do
  @moduledoc false

  @spec calculate!(any, (any -> any)) :: any
  def calculate!(stack, operation) do
    operation.(stack)
  end

  @spec calculate(any, any) :: :error | {:ok, any}
  def calculate(stack, operation) do
    try do
      {:ok, calculate!(stack, operation)}
    rescue
      _ in RuntimeError -> :error
    end
  end

  @spec calculate_verbose(any, any) :: {:error, any} | {:ok, any}
  def calculate_verbose(stack, operation) do
    try do
      {:ok, calculate!(stack, operation)}
    rescue
      error -> {:error, error.message}
    end
  end
end
