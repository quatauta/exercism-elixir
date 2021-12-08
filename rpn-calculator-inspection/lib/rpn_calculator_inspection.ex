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
      {:EXIT, ^pid, :normal} -> Map.put_new(results, input, :ok)
      {:EXIT, ^pid, _} -> Map.put_new(results, input, :error)
    after
      200 -> Map.put_new(results, input, :timeout)
    end
  end

  @spec reliability_check(calculator(), inputs :: list()) :: list()
  def reliability_check(calculator, inputs) do
    previous_exit_trap = Process.flag(:trap_exit, true)

    results =
      inputs
      |> Enum.map(fn input -> start_reliability_check(calculator, input) end)
      |> Enum.reduce(%{}, fn %{input: _, pid: _} = check, results ->
        await_reliability_check_result(check, results)
      end)

    Process.flag(:trap_exit, previous_exit_trap)
    results
  end

  @spec correctness_check(calculator(), inputs :: list()) :: results :: list()
  def correctness_check(calculator, inputs) do
    inputs
    |> Enum.map(fn input -> Task.async(fn -> calculator.(input) end) end)
    |> Enum.map(fn task -> Task.await(task, 100) end)
  end
end
