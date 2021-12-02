# Use the Plot struct as it is provided
defmodule Plot do
  @moduledoc false

  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  @moduledoc false

  @spec start(opts :: list()) :: {:error, any} | {:ok, pid()}
  def start(opts \\ []), do: Agent.start(fn -> %{plots: [], last_plot_id: 0} end, opts)

  @spec list_registrations(pid :: pid()) :: list()
  def list_registrations(pid), do: Agent.get(pid, fn %{plots: plots} -> plots end)

  @spec register(pid :: pid(), register_to :: String.t()) :: Plot
  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, last_plot_id: last_plot_id} ->
      new_plot = %Plot{plot_id: last_plot_id + 1, registered_to: register_to}
      {new_plot, %{plots: [new_plot | plots], last_plot_id: new_plot.plot_id}}
    end)
  end

  @spec release(pid :: pid(), plot_id: integer()) :: any
  def release(pid, plot_id) do
    Agent.cast(pid, fn %{plots: plots} = status ->
      plots = Enum.reject(plots, fn %{plot_id: id} -> id == plot_id end)
      %{status | plots: plots}
    end)
  end

  @spec get_registration(pid :: pid(), plot_id :: integer()) :: Plot | {:not_found, String.t()}
  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      Enum.find(plots, {:not_found, "plot is unregistered"}, fn %{plot_id: p} -> p === plot_id end)
    end)
  end
end
