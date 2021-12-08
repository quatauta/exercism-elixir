defmodule RPNCalculatorInspection do
  @moduledoc false

  @type calculator :: (input :: any() -> result :: any())

  @spec start_reliability_check(calculator(), any()) :: %{input: any(), pid: pid()}
  def start_reliability_check(calculator, input) do
    {:ok, pid} = Task.start_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  @spec await_reliability_check_result(%{:input => any, :pid => any}, results :: map()) ::
          map()
  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} -> Map.put(results, input, :ok)
      {:EXIT, ^pid, _} -> Map.put(results, input, :error)
    after
      200 -> Map.put(results, input, :timeout)
    end
  end

  @spec reliability_check(calculator(), inputs :: list()) :: list()
  def reliability_check(calculator, inputs) do
    previous_exit_trap = Process.flag(:trap_exit, true)

    inputs
    |> Enum.map(&start_reliability_check(calculator, &1))
    |> Enum.reduce(%{}, &await_reliability_check_result/2)
    |> tap(fn _ -> Process.flag(:trap_exit, previous_exit_trap) end)
  end

  @spec correctness_check(calculator(), inputs :: list()) :: results :: list()
  def correctness_check(calculator, inputs) do
    inputs
    |> Enum.map(&Task.async(fn -> calculator.(&1) end))
    |> Enum.map(&Task.await(&1, 100))
  end
end
